module stm32.vector;
import ldc.attributes;
extern(C):
@nogc:
nothrow:
pragma(LDC_no_moduleinfo);

extern(C) void _estack();
extern(C) void Reset_Handler();
extern(C) @weak void NMI_Handler() {}
extern(C) @weak void HardFault_Handler() {}
extern(C) @weak void MemManage_Handler() {}
extern(C) @weak void BusFault_Handler() {}
extern(C) @weak void UsageFault_Handler() {}
extern(C) @weak void SVC_Handler() {}
extern(C) @weak void DebugMon_Handler() {}
extern(C) @weak void PendSV_Handler() {}
extern(C) @weak void SysTick_Handler() {}
extern(C) @weak void WWDG_IRQHandler() {}
extern(C) @weak void PVD_IRQHandler() {}
extern(C) @weak void TAMP_STAMP_IRQHandler() {}
extern(C) @weak void RTC_WKUP_IRQHandler() {}
extern(C) @weak void FLASH_IRQHandler() {}
extern(C) @weak void RCC_IRQHandler() {}
extern(C) @weak void EXTI0_IRQHandler() {}
extern(C) @weak void EXTI1_IRQHandler() {}
extern(C) @weak void EXTI2_TSC_IRQHandler() {}
extern(C) @weak void EXTI3_IRQHandler() {}
extern(C) @weak void EXTI4_IRQHandler() {}
extern(C) @weak void DMA1_Channel1_IRQHandler() {}
extern(C) @weak void DMA1_Channel2_IRQHandler() {}
extern(C) @weak void DMA1_Channel3_IRQHandler() {}
extern(C) @weak void DMA1_Channel4_IRQHandler() {}
extern(C) @weak void DMA1_Channel5_IRQHandler() {}
extern(C) @weak void DMA1_Channel6_IRQHandler() {}
extern(C) @weak void DMA1_Channel7_IRQHandler() {}
extern(C) @weak void ADC1_2_IRQHandler() {}
extern(C) @weak void CAN_TX_IRQHandler() {}
extern(C) @weak void CAN_RX0_IRQHandler() {}
extern(C) @weak void CAN_RX1_IRQHandler() {}
extern(C) @weak void CAN_SCE_IRQHandler() {}
extern(C) @weak void EXTI9_5_IRQHandler() {}
extern(C) @weak void TIM1_BRK_TIM15_IRQHandler() {}
extern(C) @weak void TIM1_UP_TIM16_IRQHandler() {}
extern(C) @weak void TIM1_TRG_COM_TIM17_IRQHandler() {}
extern(C) @weak void TIM1_CC_IRQHandler() {}
extern(C) @weak void TIM2_IRQHandler() {}
extern(C) @weak void TIM3_IRQHandler() {}
extern(C) @weak void I2C1_EV_IRQHandler() {}
extern(C) @weak void I2C1_ER_IRQHandler() {}
extern(C) @weak void SPI1_IRQHandler() {}
extern(C) @weak void USART1_IRQHandler() {}
extern(C) @weak void USART2_IRQHandler() {}
extern(C) @weak void USART3_IRQHandler() {}
extern(C) @weak void EXTI15_10_IRQHandler() {}
extern(C) @weak void RTC_Alarm_IRQHandler() {}
extern(C) @weak void TIM6_DAC1_IRQHandler() {}
extern(C) @weak void TIM7_DAC2_IRQHandler() {}
extern(C) @weak void COMP2_IRQHandler() {}
extern(C) @weak void COMP4_6_IRQHandler() {}
extern(C) @weak void FPU_IRQHandler() {}


extern(C) @(section(".isr_vector")) immutable void function()[98] isr_vectors = [
	&_estack,
	&Reset_Handler,
	&NMI_Handler,
	&HardFault_Handler,
	&MemManage_Handler,
	&BusFault_Handler,
	&UsageFault_Handler,
	null,
	null,
	null,
	null,
	&SVC_Handler,
	&DebugMon_Handler,
	null,
	&PendSV_Handler,
	&SysTick_Handler,
	&WWDG_IRQHandler,
	&PVD_IRQHandler,
	&TAMP_STAMP_IRQHandler,
	&RTC_WKUP_IRQHandler,
	&FLASH_IRQHandler,
	&RCC_IRQHandler,
	&EXTI0_IRQHandler,
	&EXTI1_IRQHandler,
	&EXTI2_TSC_IRQHandler,
	&EXTI3_IRQHandler,
	&EXTI4_IRQHandler,
	&DMA1_Channel1_IRQHandler,
	&DMA1_Channel2_IRQHandler,
	&DMA1_Channel3_IRQHandler,
	&DMA1_Channel4_IRQHandler,
	&DMA1_Channel5_IRQHandler,
	&DMA1_Channel6_IRQHandler,
	&DMA1_Channel7_IRQHandler,
	&ADC1_2_IRQHandler,
	&CAN_TX_IRQHandler,
	&CAN_RX0_IRQHandler,
	&CAN_RX1_IRQHandler,
	&CAN_SCE_IRQHandler,
	&EXTI9_5_IRQHandler,
	&TIM1_BRK_TIM15_IRQHandler,
	&TIM1_UP_TIM16_IRQHandler,
	&TIM1_TRG_COM_TIM17_IRQHandler,
	&TIM1_CC_IRQHandler,
	&TIM2_IRQHandler,
	&TIM3_IRQHandler,
	null,
	&I2C1_EV_IRQHandler,
	&I2C1_ER_IRQHandler,
	null,
	null,
	&SPI1_IRQHandler,
	null,
	&USART1_IRQHandler,
	&USART2_IRQHandler,
	&USART3_IRQHandler,
	&EXTI15_10_IRQHandler,
	&RTC_Alarm_IRQHandler,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	&TIM6_DAC1_IRQHandler,
	&TIM7_DAC2_IRQHandler,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	&COMP2_IRQHandler,
	&COMP4_6_IRQHandler,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	&FPU_IRQHandler,
];
