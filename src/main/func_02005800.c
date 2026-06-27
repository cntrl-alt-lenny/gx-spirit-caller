/* func_02005800: IRQ-bracketed setter for data_021040ac+0x4. */

extern unsigned int func_0209065c(unsigned int value);
extern char data_021040ac[];

void func_02005800(int value) {
    volatile unsigned int *reg_ie = (volatile unsigned int *)0x04000210;
    func_0209065c(*reg_ie & ~1u);
    *(int *)(data_021040ac + 0x4) = value;
    func_0209065c(*reg_ie | 1u);
}
