/* func_0208e518: f8-field sibling of func_0208e4ec — *a0 = (reg>>8 & 0x1f).
 * Legacy 1.2/sp2p3. */
int func_0208e518(int *a0){
    volatile unsigned *reg = (volatile unsigned *)0x04000600;
    if (*reg & 0x4000) return -1;
    *a0 = (*reg & 0x1f00) >> 8;
    return 0;
}
