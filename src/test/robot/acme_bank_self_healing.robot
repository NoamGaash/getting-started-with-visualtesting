*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library     EyesLibrary       runner=web_ufg    config=applitools.yaml

Test Setup        Setup
Test Teardown     Teardown

*** Keywords ***
Setup
    ${remote_url}=  Get Execution Cloud URL
    Log           Remote url is ${remote_url}
    Open Browser  https://demo.applitools.com  chrome  remote_url=${remote_url}
    ...     options=set_capability('applitools:useSelfHealing', ${True});set_capability('browserVersion', 'canary-debug')

Teardown
    Close All Browsers

*** Test Cases ***
Log into bank account
    ${user_id_element1}      Execute Javascript     return window.document.querySelector("#username").id='user'+Math.round(Math.random() * 1000)
    Input Text              id:${user_id_element1}  noammmmmmmmm
    ${user_id_element2}      Execute Javascript     window.document.querySelector("#${user_id_element1}").id='user'+Math.round(Math.random() * 1000)  
    Input Text              id:${user_id_element1}  noammmmmmmmm
    