/* func_0208e4ec: read MMIO 0x04000600 — if bit14 set return -1, else write
 * (reg>>13 & 1) to *a0 and return 0. Legacy 1.2/sp2p3 (volatile double-read). */
int func_0208e4ec(int *a0){
    volatile unsigned *reg = (volatile unsigned *)0x04000600;
    if (*reg & 0x4000) return -1;
    *a0 = (*reg & 0x2000) >> 13;
    return 0;
}
