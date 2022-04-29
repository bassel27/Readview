from selenium.webdriver.chrome.options import Options
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class Scraping:
    def __init__(self):
        chromeOptions = Options()
        chromeOptions.add_argument("--log-level=3")
        self.driver = webdriver.Chrome(
            service=Service(ChromeDriverManager().install()), options=chromeOptions
        )  # to create the instance of chrome WebDriver

    def fetch_notion(self):
        self.driver.get(
            "https://sumptuous-salesman-ca6.notion.site/bf68366a212e45e1ae9bee853867c225?v=85ee9cedeb5a44c994e49033053f593b"
        )

    def get_books_elements(self):
        books = WebDriverWait(self.driver, 10).until(
            EC.presence_of_all_elements_located(
                (
                    By.XPATH,
                    '//div[@class="notion-selectable notion-page-block notion-collection-item"]',
                )
            )
        )
        return books

    def open_book(self, book):
        book.click()

    def get_author(self):
        items = self.driver.find_elements(
            By.XPATH,
            '//div[@style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"]',
        )
        return items[1].text

    def get_title(self, bookNumber):
        time.sleep(20)
        title = self.driver.find_element(
            By.XPATH, '(//div[@placeholder="Untitled"])[' + str(bookNumber) + "]"
        ).text
        return title

    def getQuotes(self):
        try:
            quotes_elements = WebDriverWait(self.driver, 20).until(
                EC.presence_of_all_elements_located(
                    (By.XPATH, '//div[@placeholder="Empty quote"]')
                )
            )
            quotes = []
            for quote_element in quotes_elements:
                quotes.append(quote_element.text)

            return quotes
        except:
            return None

    def close_book(self):
        self.driver.execute_script("window.history.go(-1)")

    def close_webdriver(self):
        self.driver.quit()


# scraping = Scraping()
# scraping.openWebDriver()
# scraping.fetch_notion()
# books = scraping.get_books_elements()
# scraping.open_book(books[0])

# scraping.getQuotes() #before
# scraping.get_author()
# scraping.get_title()
# scraping.close_book()