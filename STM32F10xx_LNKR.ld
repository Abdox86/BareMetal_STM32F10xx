/*This linker is based on STM32F10xx
Any other Cortex-M3 Processors should be suitable 
Any other Cortex-M0 / M0+ / M4 / M7 could use this, but at your own responcibility
*/


/*Also there is alot of gibberish down here I highly recommend u go and check this : https://wiki.osdev.org/Linker_Scripts
before going on.
*/

/* Author : Abdulfatah M.Alturshani 

  Resources & references will be found in DOC folder
*/

/*main entry point label*/
ENTRY(reset_handler)


/*stack end poin address*/
stackend = 0x20001000;

/*memory address definations for the flash memory and ram*/
MEMORY
{
    FLASH (rx)      : ORIGIN = 0X08000000 , LENGTH = 16K
    RAM   (rwx)     : ORIGIN = 0X20000000 , LENGTH = 6K
}


/*This will define the minimum system memory
you can change this based on your use of RAM
*/
_Min_Leftover_RAM = 0x300;

/*
SECTIONS , is how GCC dividing memory to .text(code) ,  .data(rodata,sidata) , .bss
more info here https://www.geeksforgeeks.org/memory-layout-of-c-program/
*/

SECTIONS
{
  /* The vector table goes at the start of flash. */
  .vector_table :
  {
    . = ALIGN(4);               /*. is the address right before the vector_table section*/
    KEEP (*(.vector_table))     /*KEEP this section even if it's empty*/
    . = ALIGN(4);               /*. is the address right after the vector_table section*/
  } >FLASH


  /* The 'text' section contains the main program code. */
  .text :
  {
    . = ALIGN(4);               
    *(.text)                    
    *(.text*)                   
    . = ALIGN(4);
  } >FLASH


  /* The 'rodata' section contains read-only data,
   * constants, strings, information that won't change. */
  .rodata :
  {
    . = ALIGN(4);
    *(.rodata)
    *(.rodata*)
    . = ALIGN(4);
  } >FLASH


  /* The 'data' section is space set aside in RAM for
   * things like variables, which can change. */
  _sidata = .;
  .data : AT(_sidata)
  {
    . = ALIGN(4);
    /* Mark start/end locations for the 'data' section. */
    _sdata = .;
    *(.data)
    *(.data*)
    _edata = .;
    . = ALIGN(4);
  } >RAM


  /* The 'bss' section is similar to the 'data' section,
   * but its space is initialized to all 0s at the
   * start of the program. */
  .bss :
  {
    . = ALIGN(4);
    /* Also mark the start/end of the BSS section. */
    _sbss = .;
    *(.bss)
    *(.bss*)
    *(COMMON)
    . = ALIGN(4);
    _ebss = .;
  } >RAM

  
  /* Space set aside for the application's heap/stack. */
  .dynamic_allocations :
  {
    . = ALIGN(4);
    _ssystem_ram = .;
    . = . + _Min_Leftover_RAM;
    . = ALIGN(4);
    _esystem_ram = .;
  } >RAM
}



