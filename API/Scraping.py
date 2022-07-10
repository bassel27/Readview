import threading
from audioop import add
from turtle import title
from numpy import column_stack
from pyparsing import col
from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import os
from constants import *
from selenium.common.exceptions import *
import platform
from selenium.webdriver.common.keys import Keys


# TODO: change file name to scraping.py
# TODO: empty page (no author, no title, no nothing)
# TODO: empty author or empty title
# TODO: arabic quotes
# TODO: non-ascii characters


class Scraping:
    def __init__(self, email, password):
        self.email = email
        self.password = password
        self.driver = None
        self.create_driver()
        self.wait = WebDriverWait(self.driver, WAIT_TIME)
        self.books_dict = {}

    def create_driver(self):
        chrome_options = webdriver.ChromeOptions()
        # chrome_options.add_argument("--disable-dev-sh-usage")
        chrome_options.add_argument("--no-sandbox")
        if platform.system() != "Windows":
            chrome_options.add_argument("--headless")
        # chrome_options.add_argument("--headless")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument("--window-size=1920,1080")
        chrome_options.binary_location = os.environ.get("GOOGLE_CHROME_BIN")
        self.driver = webdriver.Chrome(
            ChromeDriverManager().install(),
            # executable_path=os.environ.get("CHROMEDRIVER_PATH"),
            options=chrome_options,
        )

    def fetch_notion(self):
        self.driver.get(LOGIN_PAGE)

    def fetch_notion_old(self):
        self.driver.get(
            "https://sumptuous-salesman-ca6.notion.site/cb2ea32652c144bc9f56d03c6a5456f7?v=bf7a0255deae406986f1e80ddb854b09"
        )

    def get_books_elements(self):
        books = self.wait.until(
            EC.presence_of_all_elements_located(
                (
                    By.XPATH,
                    BOOK_XPATH,
                )
            )
        )
        return books

    def open_book(self, book):
        try:
            book.click()
        except:
            self.open_book(book)

    def get_author(self):
        try:
            author = self.wait.until(
                EC.presence_of_element_located(
                    (
                        By.XPATH,
                        AUTHOR_XPATH,
                    )
                )
            ).text
            return author
        except:
            return ""

    def get_title(self, book_number):
        try:
            title = self.wait.until(
                EC.presence_of_element_located(
                    (
                        By.XPATH,
                        '(//div[@placeholder="Untitled"])[' + str(book_number) + "]",
                    )
                )
            ).text
        except TimeoutException:
            return ""
        return title

    def getQuotes(self):  # TODO: if quote_elements = []
        if self.is_quote_present():
            time.sleep(SLEEP_TIME)
            quotes_elements = self.driver.find_elements(By.XPATH, QUOTE_XPATH)
            quotes = []
            for quote_element in quotes_elements:
                quotes.append(quote_element.text)

            return quotes
        else:
            return []

    def is_quote_present(self):
        try:
            self.driver.find_element(By.XPATH, QUOTE_XPATH)
        except:
            return False
        return True

    def close_book(self):
        self.driver.execute_script("window.history.go(-1)")

    def close_webdriver(self):
        self.driver.quit()

    def get_books(self):
        """returns a dictionary of all books"""
        self.fetch_notion_old()
        booksElements = self.get_books_elements()
        
        index = 0

        for book_number, bookElement in enumerate(booksElements):

            book_dict = {}
            self.open_book(bookElement)
            book_dict["Title"] = self.get_title(book_number + 2)
            book_dict["Author"] = self.get_author()
            for quote in self.getQuotes():
                book_dict["Quote"] = quote
                self.books_dict[index] = dict(book_dict)
                index += 1
                # print(index)
                # if index > 50:
                #     return books_dict

            self.close_book()
        return self.books_dict

    def send_and_click(self, sent_key, entry_xpath, button_xpath):
        """Used for email and password"""
        self.wait.until(
            EC.element_to_be_clickable(
                (
                    By.XPATH,
                    entry_xpath,
                )
            )
        ).send_keys(sent_key)
        self.driver.find_element(By.XPATH, button_xpath).click()

    def login(self):
        self.send_and_click(EMAIL, EMAIL_ENTRY_XPATH, EMAIL_BUTTON_XPATH)
        self.send_and_click(PASSWORD, PASSWORD_ENTRY_XPATH, PASSWORD_BUTTON_XPATH)

    def add_page(self):
        while True:
            try:
                self.wait.until(
                    EC.element_to_be_clickable(
                        (
                            By.XPATH,
                            ADD_PAGE_XPATH,
                        )
                    )
                ).click()
                break
            except:
                continue

    def type_title(self, title):
        title_entry = self.wait.until(
            EC.visibility_of_element_located(
                (
                    By.XPATH,
                    TITLE_XPATH,
                )
            )
        )
        title_entry.click()
        title_entry.send_keys(title)
        title_entry.send_keys(Keys.ENTER)

    def create_database_page(self):
        self.driver.find_element(By.XPATH, PAGE_LINE_XPATH).click()
        active_element = self.driver.switch_to.active_element
        active_element.send_keys("/database full")
        self.wait.until(
            EC.visibility_of_element_located(
                (
                    By.XPATH,
                    DATABASE_FULL_PAGE_XPATH,
                )
            )
        ).click()

    def get_column_element_by_name(self, column_name):
        columns_elements = self.wait.until(
            EC.visibility_of_all_elements_located(
                (
                    By.XPATH,
                    COLUMN_XPATH,
                )
            )
        )
        for column_element in columns_elements:
            if column_element.text == column_name:
                return column_element

    def rename_column(self, column_name, new_name):
        self.get_column_element_by_name(column_name).click()

        self.wait.until(
            EC.element_to_be_clickable(
                (
                    By.XPATH,
                    RENAME_XPATH,
                )
            )
        ).click()
        column_name_entry = self.wait.until(
            EC.visibility_of_element_located(
                (
                    By.XPATH,
                    COLUMN_NAME_ENTRY_XPATH,
                )
            )
        )
        column_name_entry.send_keys(new_name)
        column_name_entry.send_keys(Keys.ESCAPE)

    def hide_sidebar(self):
        self.driver.switch_to.active_element.send_keys(Keys.CONTROL + '\z')

    def delete_column(self, column_name):
        self.get_column_element_by_name(column_name).click()
        
        self.wait.until(
            EC.element_to_be_clickable(
                (
                    By.XPATH,
                    DELETE_COLUMN_XPATH,
                )
            )
        ).click()

    def add_column(self, column_name):

        add_button = self.wait.until(
            EC.visibility_of_element_located(
                (
                    By.XPATH,
                    ADD_COLUMN_XPATH,
                )
            )
        )
        add_button.click()
        add_button.send_keys(Keys.ESCAPE)
        columns = self.driver.find_elements(By.XPATH, COLUMN_XPATH)
        self.rename_column(columns[-1].text, column_name)  # last column

    def create_database(self):
        self.fetch_notion()
        self.login()
        self.add_page()
        self.type_title("Readview")
        self.create_database_page()
        self.type_title("Readview DB")
        # self.hide_sidebar()
        self.delete_column("Tags")
        # time.sleep(1)
        self.rename_column("Name", "Title")
        self.add_column("Author")
        # time.sleep(1)
        self.add_column("Quote")

    def add_new_row(self):
        self.driver.find_element(By.XPATH, NEW_ROW_XPATH).click()

    def type_and_switch(self, to_type):
        self.driver.switch_to.active_element.send_keys(Keys.ENTER)
        time.sleep(0.2)
        self.driver.switch_to.active_element.send_keys(to_type)
        self.driver.switch_to.active_element.send_keys(Keys.TAB)
        

    def fill_database(self, dict):
        for value in dict.values():
            self.add_new_row()
            self.driver.switch_to.active_element.send_keys(Keys.ENTER)
            self.type_and_switch(value["Title"])
            self.type_and_switch(value["Author"])
            self.type_and_switch(value["Quote"])
            html = self.driver.find_element(By.XPATH, 'html')
            html.send_keys(Keys.END)
            time.sleep(0.1)
    
    


# scraping_create = Scraping(EMAIL, PASSWORD)
# scraping_take = Scraping(EMAIL, PASSWORD)
# t1 = threading.Thread(target=scraping_create.create_database)
# t2 = threading.Thread(target=scraping_take.get_books)
# t1.start()
# t2.start()
# t1.join()
# t2.join()
# scraping_create.fill_database(scraping_take.books_dict)
# print("Done")