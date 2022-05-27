*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${username_valid}             btt_admin
${password_valid}       Kmcdka09
${username_invalid}       test
${password_invalid}       1234

*** Keywords ***
open the browser with engagement HQ platform url
    Create Webdriver    Chrome  executable_path=../Resources/chromedriver
    Go To   https://platform.replica.bangthetable.in/platform/sites


close browser session
    Close Browser