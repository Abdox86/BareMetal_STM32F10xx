/*This Startup sequence is based on STM32F10xx.
To make other use of this, you need to modify the file based on 
the devices Startup sequence.
*/

/*Most of these ar commnted out save memory , thes should be used based on ur needs*/

/* Author : Abdulfatah M.Alturshani 

    Resources & references will be found in DOC folder
*/

/*
Definations to the compiler/assembler to know what sort of instructions is this
 */
.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb


/*define global areas label*/
.global reset_handler


.type reset_handler, %function

    reset_handler: 
        ldr     r1 , = stackend
        mov     sp , r1

        /*at reset start copying the data from the flash memory */
        /*addresses that's been defined from the gcc at data initalized section*/
        /*to RAM */ 
        movs    r0, #0                  // reset the r0 to be used as address offset
        ldr     r1, =_sdata             // data start address at RAM
        ldr     r2, =_edata             // data end address at RAM
        ldr     r3, =_sidata             // target flash memory address to load init data
        b       cpy_initdata_check       // branch to check if theres data to be copy

        cpy_initdata_loop:
        ldr     r4, [r3, r0]    // r3+r0 as address to point at the data to be loaded into r4
        str     r4, [r1, r0]    // r1+r0 the address of RAM to store data to
        adds    r0, r0, #4      // increment address offset

        cpy_initdata_check:
        adds    r4, r0, r1           // add r0(offset) to the base    
        cmp     r4, r2               // check if we reached the end address
        bcc     cpy_initdata_loop    // if not then branch to cpy_init

        /*reset the bss section on RAM, the address is defined */
        /*by gcc */
        movs r0, #0             // reset the r0 to be used as address offset
        ldr  r1, =_sbss         
        ldr  r2, =_ebss
        b    reset_bss_loop
        
        /* Fill the BSS segment with '0's. */
        reset_bss:
        /*Store a 0 and increment by a word. */
            str  r0, [r1]
            adds r1, r1, #4

        reset_bss_loop:
            /*We'll use R1 to count progress here; if we aren't */
            /*done, reset the next word and increment. */ 
            cmp  r1, r2
            bcc  reset_bss

            /*branch to main function*/
            b   main

    .size reset_handler, .-reset_handler
            
/*end */