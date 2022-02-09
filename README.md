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
 
 
    The first file STM32F10xx_VT.s is the vector table for the Cortex-M3 . The first  it writes the vectors (address) at the beging of the FLASH/Program memory.
    
