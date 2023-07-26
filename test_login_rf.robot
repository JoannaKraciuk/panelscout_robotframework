*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description #automated testes for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}        xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//div[@class='MuiCardContent-root']/div[3]/span


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}      Tester-1234
Click on the Submit button
    Click Element       xpath=//*[(text()= 'Sign in')]
Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot     alert.png





