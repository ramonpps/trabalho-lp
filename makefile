CC=ghc
TARGET=bow

RES_FILE = res/python.txt
SEP_FILE = sep/python.txt
C1_FILE  = codigos/fatorial_iterativo.py
C2_FILE  = codigos/fatorial_recursivo.py

all: $(TARGET)

$(TARGET): Main.hs
	$(CC) -O2 -o $(TARGET) Main.hs

clean:
	rm -f *.o *.hi $(TARGET)

run: $(TARGET)
	./$(TARGET) $(RES_FILE) $(SEP_FILE) $(C1_FILE) $(C2_FILE)