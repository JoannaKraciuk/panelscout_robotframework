*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description #automated testes for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}        xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${LOGOUTBUTTON}     //div[@role='presentation']/ul[2]/div[2]/div[2]/span[1]
${ADDPLAYERBUTTON}    //main/div[3]/div[2]/div[1]/div[1]/a/button
${ADDPLAYERPAGELOGO}        //div[@id="__next"]/div/main/div[2]/form/div[1]/div/span
*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

Log out of the system
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Assert Dashboard
    Click On The Logout Button
    [Teardown]    Close Browser

Add player page
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Assert Dashboard
    Click Element    ${ADDPLAYERBUTTON}
    Assert Player Page
    [Teardown]    Close Browser



*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}     user10@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element       ${SIGNINBUTTON}
Click on the Logout Button
    Click Element       ${LOGOUTBUTTON}
Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Assert player page
    Wait Until Element Is Visible    ${ADDPLAYERPAGELOGO}
    Title Should Be     Add player
    Capture Page Screenshot    alert.png





