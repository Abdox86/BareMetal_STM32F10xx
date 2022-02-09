/* Author : Abdulfatah M.Alturshani 

    Resources & references will be found in DOC folder
*/
/*Quick blink example using assembly instructions for light & fast result*/
/* GPIOA -- PIN0 */
void blink (){
__asm__(
      "rcc    = 0x40021018    \n"
      "trisa  = 0x40010800    \n"
      "porta  = 0x4001080c    \n"

      "mov r1 , #0x4        \n"
      "ldr r2 , =rcc        \n"
      "str r1 , [r2]        \n"
      
      "mov r1 , #0x2        \n"
      "ldr r2 , =trisa      \n"
      "str r1 , [r2]        \n"
      
      "ldr r2 , =porta      \n"

      "BLINK:               \n"
      "mov r1 , #0x0        \n"
      "str r1 , [r2]        \n"
      "mov r1 , #0x1        \n"
      "str r1 , [r2]        \n"
      "b   BLINK            \n"
  );
}

int main() {
    
    blink();

}


