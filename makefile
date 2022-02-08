#This is the makefile which's responcible of excuting the needed commands to Compile , Assemble , and Genrate elf & hex files.

# final elf/hex name
target:= main
# Microprocessor type
MCPU:= cortex-m3
#linker file name
LNKR:= STM32F10xx_LNKR.ld

## MAKE variables 
# gcc C compiler command 
gcc:=  arm-none-eabi-gcc
#Assembly variables
asmflgs := -c
asmflgs += -O0
asmflgs += -mcpu=$(MCPU)
asmflgs += -mthumb
asmflgs += -Wall
# C variables
cflgs := -mcpu=$(MCPU)
cflgs += -mthumb
cflgs += -Wall
cflgs += -g
# assembly sources
asmsrc := $(wildcard *.s)
# C sources
csrc := $(wildcard *.c)
# object refence
objs := $(asmsrc:%.s=%.o)
objs += $(csrc:%.c=%.o) 

deps := $(patsub %.o , %.d ,$(objs))
-include $(deps)
depsflgs= -MMD -MF $(@:.o=.d)

# generate hex format from elf
$(target).hex: $(target).elf
	@arm-none-eabi-objcopy -O ihex $^ $@
	@echo "Done!!"
	@echo "Sections Size(Bytes):"
	@arm-none-eabi-size main.elf
	
# link the files using the specified linker in LNKR 
$(target).elf: $(objs)
	@$(gcc) $^ -mcpu=cortex-m3 -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -T./$(LNKR) -o $@
	@echo "linking..."

# compile all C files in the main directory
%.o: %.c 
	@$(gcc) -c $(cflgs) -fmessage-length=0 --specs=nosys.specs  $< $(depsflgs)
	@echo "Compiling..."

# assemble all assembly files in the main directory 
%.o: %.s
	@$(gcc) -x assembler-with-cpp $(asmflgs) -fmessage-length=0 $^ -o $@
	
# invoke "make clean" in the command line to clean all object & excutable files
clean:
	@rm -f *.o *.hex *.elf *.d *.asm
	@clear
	@echo "Cleared!!"

    