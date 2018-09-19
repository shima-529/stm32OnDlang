CC=arm-none-eabi-gcc
SIZE=arm-none-eabi-size
DC=ldc2
DC_MODULE=$(addprefix src/stm32/,startup.d vector.d stm32.d)

CPU=cortex-m4
CFLAGS= -mcpu=$(CPU) -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -ffunction-sections -fdata-sections -Os -g -nostartfiles -nostdlib
DFLAGS=-mtriple=thumbv7em-none-linux-gnueabihf -mcpu=$(CPU) -static -disable-linker-strip-dead -O0 -g
OBJS=$(notdir $(subst .c,.o,$(wildcard src/*.c)) $(subst .d,.o,$(wildcard src/*.d)))
OBJS:=$(filter-out startup.o,$(OBJS))
OBJS:=$(filter-out vector.o,$(OBJS))
OBJS:=$(filter-out stm32.o,$(OBJS))

all: output.elf
	$(SIZE) $^

output.elf: $(OBJS)
	$(CC) $(CFLAGS) -Wl,-T,LinkerScript.ld,-Map=output.map,--gc-sections -o $@ $^

%.o: src/%.d
	$(DC) $(DFLAGS) -c -of=$@ $(DC_MODULE) $^

flash:
	echo output.elf | xargs -I {} openocd -f interface/cmsis-dap.cfg -f target/stm32f3x.cfg -c 'init;program {};reset;exit'

clean:
	$(RM) *.o *.elf *.map
