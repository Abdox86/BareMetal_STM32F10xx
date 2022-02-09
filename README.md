# BareMetal_STM32F10xx
Starter BareMetal silution for STM32F10xx , any other Cortex-M3 devices should be suitable
(please read the device related documentations before using this silution).

  Well to start we need to know some simple concepts :
  - 1st the process here is to build everything from scrach , for both Assembly & C programs .
  - 2nd Compiling C & Assembling  is a large topic , to learn more please refere to the "/docs" folder, or run your on search.
  - 3rd link script & linking wether C or Assembly object files is a nother topic , so please if you want to learn this
    exactly refere to some links and docs provided in "/docs" folder, or run your on search.
  - Finally assuming you are fimeliar with Assembly & C (that's why you are here I bid), then you are all set to go .
  
Let's Start:

  - The first files covered are the assembly files that end with .s , here they are :
  
     ![file1](https://user-images.githubusercontent.com/99008529/153180275-cd3b8d4d-662f-4a94-960d-4913b4cde34e.png)
     
     ![file1](https://user-images.githubusercontent.com/99008529/153179957-baecdd27-5513-42c0-9605-bc8948b250e1.png)
     
    Let's start with STM32F10xx_VT.s this is the vector table for the Cortex-M3 . it's seprated into 2 sections ,
    the first one is the .vector_table , and the second is the default_interrupt_handler , those sections found under "bootHander" area .
    - .vector_table Section:-
      In this section we define the vectors label in specific order depending on the reference documentation form STM or ARM , 
      the .word keywoed used to define the length of the address depending on device's address length , in our case the word = 32 bits.
      These vectors label used to handle the related interrupt .
      * (I have commented some vectors out to reduce the finale build size (main.hex size), make sure to enable them in case you want to use them).
      
      
      
      Afterwords we mark these label as weak with the keyword .weak to make the assembler aknowledge that he can overwrite these labels 
      if they have been redfined.
      
      The .thumb_set is used to substitute the vector label with default_interrupt_handler if an interrupt is triggred accdinetlly ,
      (dont know if it's possible to happen , but these are the recommendations).
      * (Also I have commented some of these out to save on memory, make sure to enable them in case you want to use them).
    - .default_interrupt_handler Section:- 
      This section is used to handle any accdinetlly triggred interrupts (as mentioned above) , and that by infinte looping 
      to protect the MCU from doing unpredictable behaivor .
      * (You can Change this section to do any thing you want, when something wrong happen!!)
    
    Afterwords , the second file is the Startup.s , and this contains the C startup sequence section.
    - StartUp sequence:-
      This sequence is equired only if you want to use C language , in case you want to use assembly then you only need these lines:

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
                 
                    /*Write your code here*/
                    
                 .size reset_handler, .-reset_handler
                 
        The C required startup sequence is followed to the rules of C compiler , and it's only a memory Layout that we need to sketch up 
        to make the C compiled files (object files) compatible with the assembly compiled files (object files), here's a link to know more 
        about Memory Layout :https://www.geeksforgeeks.org/memory-layout-of-c-program/ . At the end of this section we branch to the main 
        function in the C file the we will create , or use the already one.
        
              /*branch to main function*/
               b   main
        
        The question here How we can create the memory sketch? . Well for that we use the linker file STM32F10xx_LNKR.ld .
        * (To know more about the linker scripts please head to /docs folder , or run a google search there's a lot suites covering it !!).
        
        At this point we create (or use) the main.c file to write the main function .
        
        After that to link everythink we need just run these commands :
        
             /*Assemble the Startup.s*/
              arm-none-eabi-gcc -x assembler-with-cpp -c -O0 -mcpu=cortex-m3 -mthumb -Wall -fmessage-length=0 Startup.s -o Startup.o
             /*Assemble the STM32F10xx_VT.s*/
              arm-none-eabi-gcc -x assembler-with-cpp -c -O0 -mcpu=cortex-m3 -mthumb -Wall -fmessage-length=0 STM32F10xx_VT.s -o STM32F10xx_VT.o
             /*Compile the main.c*/
              arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb -Wall -g -fmessage-length=0 --specs=nosys.specs  main.c -o main.o
             /*link the objects files*/
              arm-none-eabi-gcc Startup.o STM32F10xx_VT.o main.o -mcpu=cortex-m3 -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -                                             T./STM32F10xx_LNKR.ld -o main.elf
                        
        The only problem with these commands they need to be run repeatedlly , (and one fact about programmers , we don't like repeating )
        so a simple makefile is written to ease this , and actually to do more , like dynamic linking and auto directories.
        * (I wish if I could cover more about make , but there others did that , so check /docs , and run google search you will be fine).
        
        Finally if you followed and survived so far, hit make commant in the terminal (and make sure that your terminal oprating at the same directory
        of the files), then gongurates you have built your first C file from scratch !!
        
        In case you have problems please contact me on : abdulfatahalturshani98@gmail.com .
        
        
    
