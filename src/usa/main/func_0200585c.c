/* func_0200585c: IRQ-bracketed setter for data_02103fcc+0xc. */

extern unsigned int func_02090574(unsigned int value);
extern char data_02103fcc[];

void func_0200585c(int value) {
    volatile unsigned int *reg_ie = (volatile unsigned int *)0x04000210;
    func_02090574(*reg_ie & ~1u);
    *(int *)(data_02103fcc + 0xc) = value;
    func_02090574(*reg_ie | 1u);
}
