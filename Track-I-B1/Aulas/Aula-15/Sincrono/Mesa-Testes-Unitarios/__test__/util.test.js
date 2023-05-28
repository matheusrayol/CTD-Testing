/**
 * @jest-environment jsdom
*/

const { generateText, validateInput, createElement } = require('../util.js');

describe('Testes de saída de dados', () => {
    test('Saída de Nome e Idade', () => {
        const text = generateText('Daniel', 30);
        expect(text).toBe('Daniel (30 years old)');
        const text2 = generateText('Matheus', 34);
        expect(text2).toBe('Matheus (34 years old)');
    });

    it('Saída com dados vazios', () => {
        const text = generateText('', null);
        expect(text).toBe(' (null years old)');
    });

    it('Saída sem dados', () => {
        const text = generateText();
        expect(text).toBe('undefined (undefined years old)');
    });
});

describe('Validar entradas', () => {
    test('Entrada de texto', () => {
        const text = validateInput('texto');
        expect(text).toBeTruthy();
    });
    test('Entrada vazia', () => {
        const text = validateInput('');
        expect(text).toBeFalsy();
    });
    test('Entrada de número', () => {
        const text = validateInput(null, true, false);
        expect(text).toBeFalsy();
    });
    test('Entrada de espaço', () => {
        const text = validateInput(' ', true, false);
        expect(text).toBeFalsy();
    })
    test('Entrada de texto NaN', () => {
        const text = validateInput(NaN, true, false);
        expect(text).toBeFalsy();
    });
});

describe('Validar criação de elementos', () => {
    test('Criação de elemento com dados válidos', () => {
        const newElement = createElement('li', 'Exemplo de elemento', 'user-item');
        expect(newElement.textContent).toMatch(/Exemplo de elemento/);
    });
    test('Criação de elemento sem dados', () => {
        const newElement = createElement(null);
        expect(newElement.textContent).toBe("");
    })
});