# Algoritmo de Similaridade de Programas

Este projeto implementa um algoritmo de similaridade inspirado em Bag-of-Words (BoW) para comparar códigos utilizando Haskell.

**Grupo:** Ramon Santos, Maria Julia Galiza, Lucas Miranda, Pedro Umpierre, Gabriel Gomes

## Pré-requisitos

Para compilar e executar o projeto, você precisará do **GHC (Glasgow Haskell Compiler)** e do **Make**.

## 🐧 Como rodar (Linux / WSL)

1. **Instalar o compilador:**
    ```bash
    sudo apt install ghc make
    ```
2. **Limpe antes de rodar:**
    ```bash
    make clean
    ```
3. **Compile e rode o programa:**
    ```bash
    # Para ling. C: busca c1.c, c2.c e arquivos c.txt em res/sep
    make run L=c

    # Para ling. Python: busca c1.py, c2.py e arquivos py.txt em res/sep
    make run L=py
    ```
## Estrutura dos arquivos

O `makefile` automatiza a busca de arquivos baseando-se na extensão/nome fornecido na variável `L`.

* **Código fonte:** `codigos/c1.$(L)` e `codigos/c2.$(L)`
* **Palavras Reservadas:** `res/$(L).txt`
* **Separadores:** `sep/$(L).txt`

### Exemplo de uso:
Se você rodar `make run L=c`, o sistema buscará:

    .
    ├── codigos
    │   ├── c1.c
    │   └── c2.c
    ├── res
    │   └── c.txt
    └── sep
        └── c.txt