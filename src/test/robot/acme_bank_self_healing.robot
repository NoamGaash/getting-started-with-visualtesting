*** Settings ***
# Use Selenium WebDriver and Applitools Eyes.
Library     OperatingSystem
Library     SeleniumLibrary
Library     EyesLibrary       runner=web_ufg    config=applitools.yaml

# Declare setup and teardown routines.
Test Setup        Setup
Test Teardown     Teardown

*** Keywords ***
# For setup, load the demo site's login page and open Eyes to start visual testing.
Setup
    ${remote_url}=  Get Execution Cloud URL
    Log           Remote url is ${remote_url}
    ${desired caps} =     Create Dictionary    applitools:useSelfHealing=True       applitools:selfHealingOptions={findElementsSupport:true}        browser_version=canary-debug
    Open Browser  https://demo.applitools.com  chrome  remote_url=${remote_url}     desired_capabilities=${desired caps}

Teardown
    Close All Browsers

*** Test Cases ***
Log into bank account
    # Run this test, then uncomment the following line and run again:
    # ${user_id_element1}      Execute Javascript    window.document.querySelector("#username").id='user'
    
    Input Text              id:username    applibot
    