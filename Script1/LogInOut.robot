*** Settings ***
Documentation	Browser Notes Login
Library		    SeleniumLibrary

*** Variables ***
${BROWSER}            edge
${URL}                http://172.20.82.145:8000/accounts/login/

*** Test Cases ***
Login and Logout
    Open Browser      ${URL}     ${BROWSER}
	Input Text        id=id_username    tester1
	Input Password    id=id_password    testpass1
    Click Button      xpath=//button[@type='submit']
    Capture Page Screenshot    login.png
	Click Link        link=Log Out
	Capture Page Screenshot    logout.png
    Close Browser