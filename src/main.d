/* import core.bitop: volatileLoad, volatileStore; */
import stm32.startup, stm32.vector, stm32.stm32;

extern(C):
@nogc:
nothrow:
pragma(LDC_no_moduleinfo);

void ms_wait(uint ms) {
	pragma(LDC_never_inline);
	SysTick.LOAD.st(1000 - 1);
	SysTick.VAL.st(0);
	SysTick.CTRL.bset(0);

	foreach (_; 0..ms) {
		while( !SysTick.CTRL.bitIsSet(16) ) {
		}
	}
	SysTick.CTRL.bclr(0);
}

void main() {
	RCC.AHBENR.bset(22);
	GPIOF.MODER.bset(0);
	RCC.APB1ENR.bset(0);
	TIM2.CR1.bset(7, 0); // counter enable
	TIM2.DIER.bset(0, 1);
	TIM2.PSC.st(8000);
	TIM2.ARR.st(1000);
	TIM2.CCR1.st(200);
	TIM2.EGR.bset(0);
	TIM2_IRQn.enableIRQ;
	while(1) {
		/* GPIOF.ODR.bset(0); */
		/* 500.ms_wait; */
		/* GPIOF.ODR.bclr(0); */
		/* 500.ms_wait; */
	}
}

extern(C) void TIM2_IRQHandler() {
	if( TIM2.SR.bitIsSet(1) ) {
		GPIOF.ODR.bclr(0);
		TIM2.SR.bclr(1);
	}
	if( TIM2.SR.bitIsSet(0) ) {
		GPIOF.ODR.bset(0);
		TIM2.SR.bclr(0);
	}
}
