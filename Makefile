CC=clang
AS=as
CFLAGS=-arch arm64
ASFLAGS=-arch arm64
TARGET=endian-swap
ASM_SOURCE=endian_swap.asm
C_SOURCE=main.c
ASM_OBJECT=$(ASM_SOURCE:.asm=.o)

all: $(TARGET)

$(TARGET): $(ASM_OBJECT) $(C_SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(C_SOURCE) $(ASM_OBJECT)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(ASM_OBJECT) $(TARGET)

run: $(TARGET)
	./$(TARGET)
