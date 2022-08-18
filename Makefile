AS = as
LD = ld

SRCS = $(wildcard *.S)

OBJ = $(SRCS:%.S=%.o)

TARGET = main.elf

all: $(TARGET)

%.o: %.S
	$(AS) -o $@ $^

$(TARGET): $(OBJ)
	$(LD) -o $@ $^

clean: 
	rm -rf $(TARGET) $(OBJ)

run:
	./$(TARGET)

.PHONY = clean run
