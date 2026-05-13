CC=ghc
TARGET=bow
BUILD_DIR=build

# Linguagem padrão caso apenas digite "make run"
L=c

RES_FILE = res/$(L).txt
SEP_FILE = sep/$(L).txt
C1_FILE  = codigos/c1.$(L)
C2_FILE  = codigos/c2.$(L)

# O alvo principal agora aponta para o caminho dentro da pasta build
all: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET): main.hs
	@echo "Limpando e criando diretório de build..."
	@rm -rf $(BUILD_DIR) 	# Limpa o diretório de build antes de criar um novo
	@mkdir -p $(BUILD_DIR) 	# Cria o diretório de build
	$(CC) -O2 -odir $(BUILD_DIR) -hidir $(BUILD_DIR) -o $(BUILD_DIR)/$(TARGET) main.hs 	# Compila o código-fonte usando GHC, direcionando os arquivos de saída para o diretório de build

# Limpa os arquivos de build
clean:
	rm -rf $(BUILD_DIR)


run: $(BUILD_DIR)/$(TARGET)
	@echo ""
	@echo "Executando para a linguagem: $(L)"
	./$(BUILD_DIR)/$(TARGET) $(RES_FILE) $(SEP_FILE) $(C1_FILE) $(C2_FILE)