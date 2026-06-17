/* func_020851e4: func_0208e830(); func_02082244(); set MMIO 0x04000600 top bits
 * to 0b10. SP3 tier (1.2/sp3). */
extern void func_0208e830(void);
extern void func_02082244(void);
void func_020851e4(void){
    volatile unsigned *reg = (volatile unsigned *)0x04000600;
    func_0208e830();
    func_02082244();
    *reg = (*reg & ~0xc0000000u) | 0x80000000u;
}
