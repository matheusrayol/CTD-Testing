# Matheus Rayol Ferreira - T05 Part-time
*** Variables ***
${SITE}                                 https://www.chicorei.com
${BROWSER}                              Firefox
${BUTTON_COOKIES}                       id:confirmPolicyButton
${SEARCH_FIELD}                         id:header-search-input-desktop
${SEARCH_BUTTON}                        id:header-search-icon
${SEARCH_RESULT_ELEMENT}                css:#catalog-breadcrumb > li:nth-child(1) > span:nth-child(1)
${FIRST_SEARCH_RESULT}                  css:#catalog-main > div > div > div:nth-child(1) > ul > li:nth-child(1)
${PRICE_ELEMENT}                        css:.text-yanone > .d-inline-flex > .h2
${SHIRT_MODEL}                          css:nav.cr-option:nth-child(1)
${SHIRT_SIZE}                           css:div.cr-option-squared:nth-child(1)
${SHIRT_COLOR}                          css:.product-variations-colors > div:nth-child(1) > div:nth-child(1)
${BUY_BUTTON}                           css:#product-buy-button-container > button
${CART_MENU}                            css:#header-cart-desktop > div.header-topbar-btn
${CART_BUTTON}                          css:#header-cart-popover > div > div.text-center > a.btn.btn-lg.mb
${CART_TEXT_TO_VALIDATE}                Sua sacola
${CHECKOUT_BUTTON}                      css:#cart-finish > button.btn.btn-xl.btn-wide.mt.hidden-xs-down
${CHECKOUT_TEXT_TO_VALIDATE}            Login
${TC1_PRODUCT_NAME}                     Vira lata caramelo
${TC2_PRODUCT_NAME}                     Amarelo é desespero
${TC3_PRODUCT_NAME}                     Erarr
${TC4_PRODUCT_NAME}                     Nem Te Vi
${TC5_PRODUCT_NAME}                     Alceu Dispor
${TC1_SEARCH_RESULT_TEXT}               Vira lata caramelo
${TC2_SEARCH_RESULT_TEXT}               Amarelo é desespero
${TC3_SEARCH_RESULT_TEXT}               Erarr
${TC4_SEARCH_RESULT_TEXT}               Nem Te Vi
${TC5_SEARCH_RESULT_TEXT}               Alceu Dispor
${TC1_TEXT_TO_VALIDATE}                 Você está acumulando 1 ponto no cartão fidelidade!
${TC2_TEXT_TO_VALIDATE}                 Em todos os pedidos acima de R$150 para as regiões Sul e Sudeste. R$200 para as demais regiões.
${TC3_TEXT_TO_VALIDATE}                 De segunda a sexta, das 8h às 18h.
${TC4_TEXT_TO_VALIDATE}                 Compre parcelado com cartão ou a vista com boleto ou depósito
${TC5_TEXT_TO_VALIDATE}                 Sua primeira troca na Chico Rei é por nossa conta!


*** Keywords ***
Abrir o site da loja Chico Rei
    Open Browser                        ${SITE}                     ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Close Browser

Clicar em "Concordar" no aviso sobre Cookies
    Click Button                        ${BUTTON_COOKIES}

Pesquisar por "Vira lata caramelo" e selecionar a primeira opção da lista de resultados
    Input Text                          ${SEARCH_FIELD}             ${TC1_PRODUCT_NAME}         True
    Press Keys                          ${SEARCH_FIELD}  RETURN
    Wait Until Element Is Visible       ${SEARCH_RESULT_ELEMENT}
    Element Should Contain              ${SEARCH_RESULT_ELEMENT}    ${TC1_SEARCH_RESULT_TEXT}
    Click Element                       ${FIRST_SEARCH_RESULT}

Pesquisar por "Amarelo é desespero" e selecionar a primeira opção da lista de resultados
    Input Text                          ${SEARCH_FIELD}             ${TC2_PRODUCT_NAME}         True
    Press Keys                          ${SEARCH_FIELD}  RETURN
    Wait Until Element Is Visible       ${SEARCH_RESULT_ELEMENT}
    Element Should Contain              ${SEARCH_RESULT_ELEMENT}    ${TC2_SEARCH_RESULT_TEXT}
    Click Element                       ${FIRST_SEARCH_RESULT}

Pesquisar por "Erarr" e selecionar a primeira opção da lista de resultados
    Input Text                          ${SEARCH_FIELD}             ${TC3_PRODUCT_NAME}         True
    Press Keys                          ${SEARCH_FIELD}  RETURN
    Wait Until Element Is Visible       ${SEARCH_RESULT_ELEMENT}
    Element Should Contain              ${SEARCH_RESULT_ELEMENT}    ${TC3_SEARCH_RESULT_TEXT}
    Click Element                       ${FIRST_SEARCH_RESULT}

Pesquisar por "Nem Te Vi" e selecionar a primeira opção da lista de resultados
    Input Text                          ${SEARCH_FIELD}             ${TC4_PRODUCT_NAME}         True
    Press Keys                          ${SEARCH_FIELD}  RETURN
    Wait Until Element Is Visible       ${SEARCH_RESULT_ELEMENT}
    Element Should Contain              ${SEARCH_RESULT_ELEMENT}    ${TC4_SEARCH_RESULT_TEXT}
    Click Element                       ${FIRST_SEARCH_RESULT}

Pesquisar por "Alceu Dispor" e selecionar a primeira opção da lista de resultados
    Input Text                          ${SEARCH_FIELD}             ${TC5_PRODUCT_NAME}         True
    Press Keys                          ${SEARCH_FIELD}  RETURN
    Wait Until Element Is Visible       ${SEARCH_RESULT_ELEMENT}
    Element Should Contain              ${SEARCH_RESULT_ELEMENT}    ${TC5_SEARCH_RESULT_TEXT}
    Click Element                       ${FIRST_SEARCH_RESULT}

Validar se o valor do produto é "R$ 69,99"
    Element Should Contain              ${PRICE_ELEMENT}            R$ 69,99

Selecionar um tamanho, cor e clicar em comprar
    Click Element                       ${SHIRT_MODEL}
    Click Element                       ${SHIRT_SIZE}
    Click Element                       ${SHIRT_COLOR}
    Click Button                        ${BUY_BUTTON}

Clicar em "Ver sacola"
    Wait Until Element Is Visible       ${CART_BUTTON}
    Click Element                       ${CART_BUTTON}
    Page Should Contain                 ${CART_TEXT_TO_VALIDATE}

Validar se a mensagem "VOCÊ ESTÁ ACUMULANDO 1 PONTO NO CARTÃO FIDELIDADE!" está sendo exibida
    Page Should Contain                 ${TC1_TEXT_TO_VALIDATE}

# mensagem nao existe
Validar se a mensagem "Em todos os pedidos acima de R$150 para as regiões Sul e Sudeste. R$200 para as demais regiões." está sendo exibida
    Page Should Contain                 ${TC2_TEXT_TO_VALIDATE}

# horario nao existe
Validar se a mensagem "De segunda a sexta, das 8h às 18h." está sendo exibida
    Page Should Contain                 ${TC3_TEXT_TO_VALIDATE}

Validar se a mensagem "Compre parcelado com cartão ou a vista com boleto ou depósito" está sendo exibida
    Page Should Contain                 ${TC4_TEXT_TO_VALIDATE}

Validar se a mensagem "Sua primeira troca na Chico Rei é por nossa conta!" está sendo exibida
    Page Should Contain                 ${TC5_TEXT_TO_VALIDATE}

Clicar em "Fechar pedido"
    Click Button                        ${CHECKOUT_BUTTON}
    Page Should Contain                 ${CHECKOUT_TEXT_TO_VALIDATE}