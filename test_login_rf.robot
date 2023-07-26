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
${LOGOUTBUTTON}     xpath=//div[@role='presentation']/ul[2]/div[2]/div[2]/span[1]
${ADDPLAYERBUTTON}    xpath=//main/div[3]/div[2]/div[1]/div[1]/a/button
${ADDPLAYERPAGELOGO}        xpath=//div[@id="__next"]/div/main/div[2]/form/div[1]/div/span
${PLAYEREMAIL}       xpath=//*[@name='email']
${PLAYERNAME}        xpath=//*[@name='name']
${PLAYERSURNAME}     xpath=//*[@name='surname']
${PHONE}       xpath=//*[@name='phone']
${WEIGHT}      xpath=//*[@name='weight']
${HEIGHT}      xpath=//*[@name='height']
${PLAYERAGE}     xpath=//*[@name='age']
${LEGSELECT}        xpath=//*[@id='mui-component-select-leg']
${RIGHTLEG}     xpath=//ul[@role='listbox']/li[1]
${CLUBNAME}     xpath=//*[@name='club']
${PLAYERLEVEL}      xpath=//*[@name='level']
${MAINPOSITION}     xpath=//*[@name='mainPosition']
${SECONDPOSITION}       xpath=//*[@name='secondPosition']
${DISTRICTSELECT}       xpath=//*[@id='mui-component-select-district']
${DISTRICTSILESIA}      xpath=//li[@data-value='slaskie']
${ACHIEVEMENT}      xpath=//*[@name='achievements']
${LANGUAGEBUTTON}       xpath=//main/div[2]/form/div[2]/div[1]/div[15]/button/span[1]
${LANGUAGEINPUT}        xpath=//*[@name='languages[0]']
${YOUTUBEBUTTON}        xpath=//*[contains(@class, 'MuiGrid-root')]/div[19]/button/span[1]
${YOUTUBEINPUT}     xpath=//*[@name='webYT[0]']
${SUBMITBUTTON}     xpath=//*[@type='submit']/span[1]
${CHANGELANGUAGE}       xpath=//div[@role='presentation']/ul[2]/div[1]/div[2]/span[1]
${ACTUALINFO}       xpath=//div[@id="__next"]/form/div/div/div[3]/span[1]

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

Login to the system with invalid data
    Open login page
    Type in invalid email
    Type in password
    Click on the Submit button

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

Add player form
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Assert Dashboard
    Click Element    ${ADDPLAYERBUTTON}
    Assert Player Page
    Type In Player Email
    Type In Player Name
    Type in Player Surname
    Type in Player Phone
    Type in Player Weight
    Type in Player Height
    Type in Player Age
    Click Element       ${LEGSELECT}
    Wait Until Element Is Visible    ${RIGHTLEG}
    Click Element    ${RIGHTLEG}
    Type in Club Name
    Type in Player Level
    Type in Player Main Position
    Type in Player Second Position
    Click Element       ${DISTRICTSELECT}
    Scroll Element Into View        ${DISTRICTSILESIA}
    Click Element       ${DISTRICTSILESIA}
    Type in Achievement
    Click Element       ${LANGUAGEBUTTON}
    Type in Language
    Click Element       ${YOUTUBEBUTTON}
    Click Element       ${YOUTUBEINPUT}
    Type in YouTube Link
    Click Element       ${SUBMITBUTTON}
    [Teardown]    Close Browser

Change language
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Assert Dashboard
    Click Language Button
    [Teardown]    Close Browser




*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}     user10@getnada.com
Type in invalid email
    Input Text    ${EMAILINPUT}     user10@getnada.co
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element       ${SIGNINBUTTON}
Click on the Logout Button
    Click Element       ${LOGOUTBUTTON}
Type in Player Email
    Input Text    ${PLAYEREMAIL}    smith@gmail.com
Type in Player Name
    Input Text    ${PLAYERNAME}     Kevin
Type in Player Surname
    Input Text    ${PLAYERSURNAME}      Smith
Type in Player Phone
    Input Text    ${PHONE}      +48 500 600 700
Type in Player Weight
    Input Text    ${WEIGHT}     70
Type in Player Height
    Input Text    ${HEIGHT}     178
Type in Player Age
    Input Text    ${PLAYERAGE}      22.04.2000
Type in Club Name
    Input Text    ${CLUBNAME}       Nebraska
Type in Player Level
    Input Text    ${PLAYERLEVEL}    Junior
Type in Player Main Position
    Input Text    ${MAINPOSITION}   Striker
Type in Player Second Position
    Input Text    ${SECONDPOSITION}     Goalkeeper
Type in Achievement
    Input Text    ${ACHIEVEMENT}        None
Type in Language
    Input Text    ${LANGUAGEINPUT}      English
Type in YouTube Link
    Input Text    ${YOUTUBEINPUT}       www.youtube.com
Click Language Button
    Click Element    ${CHANGELANGUAGE}



Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Assert player page
    Wait Until Element Is Visible    ${ADDPLAYERPAGELOGO}
    Title Should Be     Add player
    Capture Page Screenshot    alert.png
Asser actual info
    Wait Until Element Is Visible   ${ACTUALINFO}
    Title Should Be    Identifier or password invalid.
    Capture Page Screenshot    alert.png






