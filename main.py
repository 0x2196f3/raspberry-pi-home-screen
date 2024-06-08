import platform
import time

from selenium import webdriver
from selenium.webdriver.common.by import By


import config


def login(driver, username, password):
    time.sleep(2)
    inputs = driver.find_elements(by=By.TAG_NAME, value="input")
    inputs[0].send_keys(username)
    inputs[1].send_keys(password)

    driver.execute_script("document.getElementsByClassName('action')[0].children[0].click();")

    time.sleep(10)
    
    driver.execute_script("document.getElementsByTagName('home-assistant')[0].shadowRoot.childNodes[2].shadowRoot.childNodes[2].children[0].shadowRoot.childNodes[3].children[0].click()")



if __name__ == "__main__":
    options = webdriver.FirefoxOptions()

    options.binary_location = "/usr/lib/firefox/firefox"

    options.executable_path = "/usr/lib/firefox/geckodriver"

    # driver = webdriver.Firefox(options=options)

    driver = webdriver.Firefox(executable_path="/usr/lib/firefox/geckodriver")

    driver.fullscreen_window()

    url = config.url

    driver.get(url)

    login(driver, config.username, config.password)
