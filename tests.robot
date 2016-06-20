*** Settings ***
Library       mylib.py
Library       String 

*** Variables ***
${OKCODE}         200
${CONTTYPE}       application/json
${NOTAUTHCODE}    401
${NOTFOUNDCODE}   404
        

*** Test Cases ***
Get Method Case
    ${object} =     Get Method
    Should Be Equal As Strings     ${object.status_code}              ${OKCODE} 
    Should Be Equal                ${object.headers['content-type']}  ${CONTTYPE}
  
Templated Auth Case
    [Template]      The result of authenticating ${user} ${passwd} should be ${STATCODE}
    john             doe               ${NOTAUTHCODE}
    vasiliy          pupkin            ${NOTAUTHCODE}
    user             passwd            ${OKCODE}

Stream Method Case
    [Template]      Calling the stream method with ${num} argument should contain ${STATCODE} response and ${linesnum} lines
    5               ${OKCODE}          5
    0               ${OKCODE}          0
    100             ${OKCODE}          100
    

*** Keywords ***
The result of authenticating ${user} ${passwd} should be ${STATCODE}
    ${object} =     Auth Method     ${user}     ${passwd}
    Should Be Equal As Strings                  ${object.status_code}             ${STATCODE}

Calling the stream method with ${num} argument should contain ${STATCODE} response and ${linesnum} lines
    ${object} =     Stream Method               ${num}
    ${length} =     Get Line Count              ${object.text}
    Should Be Equal As Strings                  ${object.status_code}             ${STATCODE}
    Should Be Equal As Strings                  ${length}                         ${linesnum}
