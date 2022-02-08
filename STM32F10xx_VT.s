/*This Vector Table is based on STM32F10xx.
To make other use this, you need to modify this based on 
the devices vector table order.
*/

/*Most of these ar commnted out save memory , thes should be used based on ur needs*/

/* Author : Abdulfatah M.Alturshani 

    Resources & references will be found in DOC folder
*/

/*These instructions define attributes of our chip and 
the assembly language we'll use:
*/ 
.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb


/*define global areas label*/
.global bootHandler
.global default_interrupt_handler

/* vector table body */
.type bootHandler, %object
    .section    .vector_table,"a",%progbits

     vectorTable: 
            .word stackend
            .word reset_handler
            /*Internal Interrupt Handlers */
            .word NMI_handler
            .word hard_fault_handler
            .word MemManage_handler
            .word BusFault_handler
            .word UsageFault_handler
            /* 
            .word 0
            .word 0
            .word 0
            .word 0
            .word SVC_handler
            .word DebugMon_handler
            .word 0
            .word pending_SV_handler
            .word SysTick_handler
            */
            /* External Interrupts*/
            /* 
            .word WWDG_IRQhandler
            .word PVD_IRQ_handler
            .word TAMPER_IRQ_handler
            .word RTC_IRQ_handler
            .word flash_IRQ_handler
            .word RCC_IRQ_handler
            .word EXTI0_IRQ_handler
            .word EXTI1_IRQ_handler
            .word EXTI2_IRQ_handler
            .word EXTI4_IRQ_handler
            .word DMA1_chan1_IRQ_handler
            .word DMA1_chan2_IRQ_handler
            .word DMA1_chan3_IRQ_handler
            .word DMA1_chan4_IRQ_handler
            .word DMA1_chan5_IRQ_handler
            .word DMA1_chan6_IRQ_handler
            .word DMA1_chan7_IRQ_handler
            .word ADC1_IRQ_handler
            .word USB_HP_CAN1_TX_IRQ_handler
            .word USB_LP_CAN1_RX0_IRQ_handler
            .word CAN1_RX1_IRQ_handler 
            .word CAN1_SCE_IRQ_handler
            .word EXTI9_5_IRQ_handler
            .word TIM1_break_IRQ_handler
            .word TIM1_UP_IRQ_handler 
            .word TIM1_TRG_COM_IRQ_handler
            .word TIM1_CC_IRQ_handler
            .word TIM2_IRQ_handler
            .word TIM3_IRQ_handler
            .word 0
            .word I2C1_EV_IRQ_handler
            .word I2C1_ER_IRQ_handler
            .word 0
            .word 0
            .word SPI1_IRQ_handler  
            .word USART1_IRQ_handler
            .word USART2_IRQ_handler
            .word 0
            .word EXTI15_10_IRQ_handler
            .word RTCAlarm_IRQ_handler 
            .word USBWakeUp_IRQ_handler
            */
            /*define weak labels for the interrupts , if user redefine later */
            /*these labels will be ignored*/
            /*default interrupt is to take over in case one of the interrupts triggred */
            /*but without configuration */
            .weak NMI_handler
            .thumb_set NMI_handler,default_interrupt_handler

            .weak hard_fault_handler
            .thumb_set hard_fault_handler,default_interrupt_handler

            .weak MemManage_handler
            .thumb_set hard_fault_handler,default_interrupt_handler
            
            .weak BusFault_handler
            .thumb_set BusFault_handler,default_interrupt_handler
            
            .weak UsageFault_handler
            .thumb_set UsageFault_handler,default_interrupt_handler
            /*
            .weak DebugMon_handler
            .thumb_set DebugMon_handler,default_interrupt_handler

            .weak SVC_handler
            .thumb_set SVC_handler,default_interrupt_handler
            
            .weak pending_SV_handler
            .thumb_set pending_SV_handler,default_interrupt_handler
            
            .weak SysTick_handler
            .thumb_set SysTick_handler,default_interrupt_handler
            
            .weak WWDG_IRQhandler
            .thumb_set WWDG_IRQhandlerr,default_interrupt_handler
            
            .weak PVD_IRQ_handler
            .thumb_set PVD_IRQ_handler,default_interrupt_handler
            
            .weak TAMPER_IRQ_handler
            .thumb_set TAMPER_IRQ_handler,default_interrupt_handler

            .weak RTC_IRQ_handler
            .thumb_set RTC_IRQ_handler,default_interrupt_handler
            
            .weak flash_IRQ_handler
            .thumb_set flash_IRQ_handler,default_interrupt_handler
            
            .weak RCC_IRQ_handler
            .thumb_set RCC_IRQ_handler,default_interrupt_handler
            
            .weak EXTI0_IRQ_handler
            .thumb_set EXTI0_IRQ_handler,default_interrupt_handler

            .weak EXTI1_IRQ_handler
            .thumb_set EXTI1_IRQ_handler,default_interrupt_handler
            
            .weak EXTI2_IRQ_handler
            .thumb_set EXTI2_IRQ_handler,default_interrupt_handler

            .weak EXTI3_IRQ_handler
            .thumb_set EXTI3_IRQ_handler,default_interrupt_handler
            
            .weak EXTI4_IRQ_handler
            .thumb_set EXTI4_IRQ_handler,default_interrupt_handler
            
            .weak DMA1_chan1_IRQ_handler
            .thumb_set DMA1_chan1_IRQ_handler,default_interrupt_handler
            
            .weak DMA1_chan2_IRQ_handler
            .thumb_set DMA1_chan2_IRQ_handler,default_interrupt_handler
            
            .weak DMA1_chan3_IRQ_handler
            .thumb_set DMA1_chan3_IRQ_handler,default_interrupt_handler
            
            .weak DMA1_chan4_IRQ_handler
            .thumb_set DMA1_chan4_IRQ_handler,default_interrupt_handler

            .weak DMA1_chan5_IRQ_handler
            .thumb_set DMA1_chan5_IRQ_handler,default_interrupt_handler

            .weak DMA1_chan6_IRQ_handler
            .thumb_set DMA1_chan6_IRQ_handler,default_interrupt_handler

            .weak DMA1_chan7_IRQ_handler
            .thumb_set DMA1_chan7_IRQ_handler,default_interrupt_handler

            .weak ADC1_IRQ_handler
            .thumb_set ADC1_IRQ_handler,default_interrupt_handler
            
            .weak USB_HP_CAN1_TX_IRQ_handler
            .thumb_set USB_HP_CAN1_TX_IRQ_handler,default_interrupt_handler

            .weak USB_LP_CAN1_RX0_IRQ_handler
            .thumb_set USB_LP_CAN1_RX0_IRQ_handler,default_interrupt_handler

            .weak CAN1_RX1_IRQ_handler 
            .thumb_set CAN1_RX1_IRQ_handler,default_interrupt_handler

            .weak CAN1_SCE_IRQ_handler
            .thumb_set CAN1_SCE_IRQ_handler,default_interrupt_handler

            .weak EXTI9_5_IRQ_handler
            .thumb_set EXTI9_5_IRQ_handler,default_interrupt_handler

            .weak TIM1_break_IRQ_handler
            .thumb_set TIM1_break_IRQ_handler,default_interrupt_handler

            .weak TIM1_UP_IRQ_handler 
            .thumb_set TIM1_UP_IRQ_handler ,default_interrupt_handler

            .weak TIM1_TRG_COM_IRQ_handler
            .thumb_set TIM1_TRG_COM_IRQ_handler ,default_interrupt_handler

            .weak TIM1_CC_IRQ_handler
            .thumb_set TIM1_CC_IRQ_handler ,default_interrupt_handler

            .weak TIM2_IRQ_handler
            .thumb_set TIM2_IRQ_handler ,default_interrupt_handler

            .weak TIM3_IRQ_handler
            .thumb_set TIM3_IRQ_handler ,default_interrupt_handler

            .weak I2C1_EV_IRQ_handler
            .thumb_set I2C1_EV_IRQ_handler ,default_interrupt_handler

            .weak I2C1_ER_IRQ_handler
            .thumb_set I2C1_ER_IRQ_handler ,default_interrupt_handler  

            .weak SPI1_IRQ_handler  
            .thumb_set SPI1_IRQ_handler ,default_interrupt_handler

            .weak USART1_IRQ_handler
            .thumb_set USART1_IRQ_handler ,default_interrupt_handler

            .weak USART2_IRQ_handler
            .thumb_set USART2_IRQ_handler ,default_interrupt_handler

            .weak EXTI15_10_IRQ_handler
            .thumb_set EXTI15_10_IRQ_handler ,default_interrupt_handler

            .weak RTCAlarm_IRQ_handler 
            .thumb_set RTCAlarm_IRQ_handler  ,default_interrupt_handler

            .weak USBWakeUp_IRQ_handler
            .thumb_set USBWakeUp_IRQ_handler ,default_interrupt_handler
            */

            /*Dynamic section size calculation*/
            .size vectorTable , .-vectorTable




     /*define the actual section of the default interrupt handler*/
    .section   .text.default_interrupt_handler,"ax",%progbits

        default_interrupt_handler:
            /*in case of accedintal interrupt branch to infinit loop */
            default_interrupt_loop:
                b   default_interrupt_loop

            .size default_interrupt_handler, .-default_interrupt_handler 