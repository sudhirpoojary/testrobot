*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${Username_xpath}=  //input[@id='EmailOrLogin']
${Sites_xpath}=     //a[contains(text(),'Sites')]
*** Test Cases ***
Login to Engagement HQ
    open the browser with engagement HQ platform url
    fill the login form
    verify that login is successfull
*** Keywords ***
open the browser with engagement HQ platform url
    Create Webdriver    Chrome  executable_path=/usr/local/chromedriver
    Go To   https://platform.replica.bangthetable.in/platform/sites

fill the login form
    Wait Until Element Is Visible   xpath:${Username_xpath}
    Input Text      xpath:${Username_xpath}                                                  btt_admin
    Input Password  id:Password                                                        Kmcdka09
    Click Button    xpath://button[contains(text(),'Sign in')]

verify that login is successfull
    Wait Until Element Is Visible   xpath:${Sites_xpath}
    ${result}=  Get Text            xpath:${Sites_xpath}
    Should Be Equal As Strings   ${result}  SITES