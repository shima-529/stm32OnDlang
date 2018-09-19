module stm32.startup;
extern(C):
@nogc:
nothrow:
pragma(LDC_no_moduleinfo);
// variables defined on LinkerScript.ld
extern(C) void _estack();
extern(C) int _sidata;
extern(C) int _sdata;
extern(C) int _edata;
extern(C) int _sbss;
extern(C) int _ebss;

void main();

/*
 * estack: the end point of stack
 * .isr_vector: the section for interrupt vector
 * _sidata: the address for the start of .data section(not aligned)
 * _sdata: the address for the start of .data section(aligned)
 * _edata: the address for the end of .data section
 */
extern(C) void Reset_Handler() {
	// copy .data section to SRAM
	int offset = 0;
	while( &_sdata + offset < &_edata ) {
		*(&_sdata + offset) = *(&_sidata + offset);
		offset++;
	}

	// .bss section initialization
	offset = 0;
	while( &_sbss + offset < &_ebss ) {
		*(&_sbss + offset) = 0;
		offset++; // Fill zero in all area
	}

	main();

	/*
	 * main() should not return. If it returns, program goes into infinite loop.
	 * Note that all IRQHandlers can be called even in this loop.
	 */
	while(114514) {
	}
}

void __aeabi_unwind_cpp_pr0() {}
void __tls_get_addr() {}
void _d_arraybounds(string file, uint line) {}
