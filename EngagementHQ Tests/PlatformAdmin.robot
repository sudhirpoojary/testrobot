*** Settings ***
Library  SeleniumLibrary
Library     SeleniumLibrary
Resource     Resource.robot
Library     String
Test Teardown  close browser session
Test Setup      open the browser with engagement HQ platform url

*** Variables ***
${Username_xpath}=  //input[@id='EmailOrLogin']
${Sites_xpath}=     //a[contains(text(),'Sites')]
${errormsg_xpath}=  //div[contains(text(),'Invalid login or password')]
${name}=    AutomationTesting

*** Test Cases ***
Login to Engagement HQ Platform
    fill the login form         ${username_valid}   ${password_valid}
    verify that login is successfull

Verify unsuccessfull login to Engagement HQ Platform
    fill the login form     ${username_invalid}   ${password_invalid}
    verify that login is unsuccessfull

Verify that a new site is created
    fill the login form         ${username_valid}   ${password_valid}
    Click on add button
    fill the site details form and create site
    #verify that site is created successsfully

*** Keywords ***

fill the login form

    [Arguments]     ${username}     ${password}
    Wait Until Element Is Visible   xpath:${Username_xpath}
    Input Text      xpath:${Username_xpath}                                                  ${username}
    Input Password  id:Password                                                              ${password}
    Click Button    xpath://button[contains(text(),'Sign in')]

verify that login is successfull
    Wait Until Element Is Visible   xpath:${Sites_xpath}
    ${result}=  Get Text            xpath:${Sites_xpath}
    Should Be Equal As Strings   ${result}  SITES

verify that login is unsuccessfull
    Wait Until Element Is Visible           xpath:${errormsg_xpath}
    ${result_unsuccess}=  Get Text           xpath:${errormsg_xpath}
    Should Be Equal As Strings   ${result_unsuccess}    Invalid login or password

Click on add button
    Wait Until Element Is Visible           xpath:/html/body/div/div[2]/div/div/div[1]/h1/div/a
    Click Element       xpath:/html/body/div/div[2]/div/div/div[1]/h1/div/a

fill the site details form and create site
    ${randomNumber}=    Generate random string    4    0123456789
    #log             ${name}${randomNumber}
    Input Text          xpath://input[@id='form_client_name']         ${name}${randomNumber}
    Input Text          id:form_name                                  ${name}${randomNumber}
    Input Text          id:form_secondary_domain                      ${name}${randomNumber}
    Select From List By Index       id:form_licence_type                1