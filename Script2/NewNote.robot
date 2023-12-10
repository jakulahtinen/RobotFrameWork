*** Settings ***
Documentation	Browser Notes Login
Library		    SeleniumLibrary

*** Variables ***
${BROWSER}            edge
${URL}                http://192.168.100.41:8000

*** Test Cases ***
Add new notes
    Open Browser      ${URL}     ${BROWSER}
    Click Link        link=Log In
	Input Text        id=id_username    tester1
	Input Password    id=id_password    testpass1
    Click Button      xpath=//button[@type='submit']
    Capture Page Screenshot    login.png
    Go To             ${URL}/notes/add
    Capture Page Screenshot    addnotes.png
    Input Text        id=id_subject       Add new notes script
    Input Text        id=id_text          This is test script for a new note.    
    Input Text        id=id_date          13-11-2023
    Input Text        id=id_userid        1
    Click Button      xpath=//input[@type='submit' and @value='Save']
    Go To             ${URL}/notes/
    ${latest_note_text}=    Get Text    xpath=//ul/li[last()]
    Should Contain    ${latest_note_text}    Add new notes script
    Should Contain    ${latest_note_text}    This is test script for a new note.
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2 seconds
    Capture Page Screenshot    noteIsSaved.png    
    Sleep    2 seconds
    Close Browser
