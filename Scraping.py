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
        self.driver.set_window_position(-10000, 0)

    def fetchNotion(self):
        self.driver.get(
            "https://sumptuous-salesman-ca6.notion.site/bf68366a212e45e1ae9bee853867c225?v=85ee9cedeb5a44c994e49033053f593b"
        )

    def getBooks(self):
        books = WebDriverWait(self.driver, 10).until(
            EC.presence_of_all_elements_located(
                (
                    By.XPATH,
                    '//div[@class="notion-selectable notion-page-block notion-collection-item"]',
                )
            )
        )
        return books

    def openBook(self, book):
        book.click()

    def getAuthor(self):
        items = self.driver.find_elements(
            By.XPATH,
            '//div[@style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"]',
        )
        return items[1].text

    def getTitle(self, bookNumber):
        title = self.driver.find_element(
            By.XPATH, '(//div[@placeholder="Untitled"])[' + str(bookNumber) + "]"
        ).text
        return title

    def getQuotes(self):
        try:
            time.sleep(20)
            quotesElements = WebDriverWait(self.driver, 20).until(
                EC.presence_of_all_elements_located(
                    (By.XPATH, '//div[@placeholder="Empty quote"]')
                )
            )
            quotes = []
            for quoteElement in quotesElements:
                quotes.append(quoteElement.text)

            return quotes
        except:
            return None

    def closeBook(self):
        self.driver.execute_script("window.history.go(-1)")

    def closeWebDriver(self):
        self.driver.quit()


# scraping = Scraping()
# scraping.openWebDriver()
# scraping.fetchNotion()
# books = scraping.getBooks()
# scraping.openBook(books[0])

# scraping.getQuotes() #before
# scraping.getAuthor()
# scraping.getTitle()
# scraping.closeBook()
