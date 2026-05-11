CC=ghc
TARGET=bow

RES_FILE = res/dart.txt
SEP_FILE = sep/dart.txt
C1_FILE  = codigos/text.dart
C2_FILE  = codigos/button.dart

all: $(TARGET)

$(TARGET): Main.hs
	$(CC) -O2 -o $(TARGET) Main.hs

clean:
	rm -f *.o *.hi $(TARGET)

run: $(TARGET)
	./$(TARGET) $(RES_FILE) $(SEP_FILE) $(C1_FILE) $(C2_FILE)