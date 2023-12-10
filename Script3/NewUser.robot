*** Settings ***
Documentation	Browser Notes Login
Library		    SeleniumLibrary

*** Variables ***
${BROWSER}            edge
${URL}                http://192.168.100.41:8000

*** Test Cases ***
Add new user
    Open Browser      ${URL}     ${BROWSER}
    Click Link        link=Log In
	Input Text        id=id_username    admin
	Input Password    id=id_password    admin
    Click Button      xpath=//button[@type='submit']
    Capture Page Screenshot    loginAdmin.png
    Go To             ${URL}/admin/
    Capture Page Screenshot    djangoPage.png
    Click Link        xpath=//a[@class='addlink' and contains(@href, '/admin/auth/user/add/')]
    Input Text        id=id_username    newUser111
    Input Password    id=id_password1   Qwertyuiop12345
    Input Password    id=id_password2   Qwertyuiop12345
    Capture Page Screenshot    djangoNewUser.png
    Click Button      xpath=//input[@type='submit' and @value='Save']
    Sleep    5 seconds
    Capture Page Screenshot    accountCreated.png
    Go To             ${URL}
    Click Link        link=Log Out
    Click Link        link=Log In
    Input Text        id=id_username    newUser111
	Input Password    id=id_password    Qwertyuiop12345
    Click Button      xpath=//button[@type='submit']
    Capture Page Screenshot    newUserLogin.png
