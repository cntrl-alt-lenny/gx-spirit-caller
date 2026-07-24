/* func_ov004_021d8d1c: sub-engine DISPCNT display-mode field RMW (clear low
 * 2 bits of the mode nibble), then zero two trailing regs. Two separate
 * reads of *reg (mode, then base) matches ov006's family-E MMIO idiom. */

int func_ov004_021d8d1c(void) {
    volatile unsigned long *reg = (volatile unsigned long *)0x04001000;
    unsigned long mode = (*reg & 0x1f00) >> 8;
    unsigned long base = *reg & ~0x1f00;
    *reg = base | ((mode & ~0x3) << 8);
    *(volatile unsigned long *)0x04001010 = 0;
    *(volatile unsigned long *)0x04001014 = 0;
    return 1;
}
