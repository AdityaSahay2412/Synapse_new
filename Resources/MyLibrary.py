import random
import re
import datetime
import string
import logging
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support import expected_conditions as EC

ROBOT_LIBRARY_SCOPE = "GLOBAL"


class MyLibrary:
    @property
    def get_driver_instance(self):

        driver = BuiltIn().get_library_instance('Selenium2Library')
        return driver

    def get_chromedriver_path(self):
        try:
            # logging.basicConfig(level=logging.INFO)
            driver_path = ChromeDriverManager().install()
            print(driver_path)
            return driver_path
        except Exception as e:
            print(f"Error: {e}")
            return None


    def chrome_open(self,DOWNLOAD_PATH, headless=True):
        chrome_options = webdriver.ChromeOptions()

        # Exclude automation switch
        chrome_options.add_experimental_option("excludeSwitches", ['enable-automation'])

        # Set geolocation permission to allow (1: allow, 2: deny)
        merged_prefs = {
            "profile.default_content_setting_values.geolocation": 1,
            'download.default_directory': DOWNLOAD_PATH,
            'credentials_enable_service': False,
            'profile': {
                'password_manager_enabled': False
            }
        }
        chrome_options.add_experimental_option('prefs', merged_prefs)

        # Other Chrome options
        chrome_options.add_argument("--disable-extensions")
        # chrome_options.add_argument("--disable-notifications")
        chrome_options.add_argument("--start-maximized")
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        if headless:
            chrome_options.add_argument("--headless")
            chrome_options.add_argument("--window-size=1366,768")
        return chrome_options

    def extract_number(self, text):
        pattern = r"[^\d]+(\d+\.\d+)"

        # Use regular expression to find the number part
        match = re.search(pattern, text)
        if match:
            number_str = match.group(1)
            try:
                # Convert the string to a float and return it
                return float(number_str)
            except ValueError:
                # Invalid number format
                return None
        else:
            # No number found
            return None

    def get_tommorow_date(self):
        # today = datetime.date.today()
        today = datetime.datetime.utcnow().date()
        tmrwdate = today + datetime.timedelta(days=1)
        return str(tmrwdate.strftime('%d %B %Y'))
