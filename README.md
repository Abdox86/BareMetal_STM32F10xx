# BareMetal_STM32F10xx
Starter BareMetal silution for STM32F10xx , any other Cortex-M3 devices should be suitable
(please read the device related documentations before using this silution.

  Well to start we need to know some simple concepts :
  - First the process here is to build everything from scrach , for both Assembly & C programming .
  - Compiling C & Assembling  is a large topic , to learn more please refere to the "/docs" folder, or run your on search.
  - Second link script & linking wether C or Assembly object files is a nother topic , so please if you want to learn this
    exactly refere to some links and docs provided in "/docs" folder.
  - Finally assuming you are fimeliar with Assembly & C (that's why you are here I bid), then you are all set to go .
  
Let's Start:

  - The first files covered is the assembly files that end with .s , here they are :
 
 
    Let's start with STM32F10xx_VT.s this is the vector table for the Cortex-M3 . it's seprated into to sections ,
    the first one is the vector table , and the second is the Defaulte interrupt handler , those sections found under "bootHander" area .
    - Vector Table Section:-
      In this section we define the vectors label in specific order depending on the reference documentation form STM or ARM , 
      the .word keywoed used to define the length of the address depending on device's address length , in our case the word = 32 bits.
      These vectors label used to handle the related interrupt .
      * (I have commented some vectors out to reduce the finale build size (main.hex size), make sure to enable them in case you want to use them).
      
      
      
      Afterwords we mark these label as weak with the keyword .weak to make the assembler aknowledge that he can overwrite these labels 
      if they have been redfined.
      
      The .thumb_set is used to substitute the vector label with default_interrupt_handler if an interrupt is triggred accdinetlly ,
      (dont know if it's possible to happen , but these are the recommendations).
      * (Also I have commented some of these out to save on memory, make sure to enable them in case you want to use them).
      
    - StartUp sequence:-
      
    
