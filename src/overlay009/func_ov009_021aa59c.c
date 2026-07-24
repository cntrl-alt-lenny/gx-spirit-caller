/* func_ov009_021aa59c: clear the low 2 bits of the sub-engine DISPCNT mode
 * field (bits8-12 at 0x04001000), zero two follow-on MMIO words. Two reads
 * of the volatile register match the orig's double ldr. */
int func_ov009_021aa59c(void) {
    volatile unsigned int *reg = (volatile unsigned int *)0x04001000;
    unsigned int mode = (*reg & 0x1f00) >> 8;
    *reg = (*reg & ~0x1f00) | ((mode & ~3) << 8);
    *(volatile unsigned int *)0x04001010 = 0;
    *(volatile unsigned int *)0x04001014 = 0;
    return 1;
}
