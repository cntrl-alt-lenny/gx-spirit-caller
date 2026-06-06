/* func_020852cc: func_0208e918(); func_0208232c(); set MMIO 0x04000600 top bits
 * to 0b10. SP3 tier (1.2/sp3). */
extern void func_0208e918(void);
extern void func_0208232c(void);
void func_020852cc(void){
    volatile unsigned *reg = (volatile unsigned *)0x04000600;
    func_0208e918();
    func_0208232c();
    *reg = (*reg & ~0xc0000000u) | 0x80000000u;
}
