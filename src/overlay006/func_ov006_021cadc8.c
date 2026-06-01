/* func_ov006_021cadc8: set/clear one bit of the sub-engine DISPCNT display-
 * mode field (bits 12:8) per the flag arg, preserving the rest of the field.
 * Returns 1. One of an 8-member family parameterized only by the toggled bit
 * {0x2, 0x4, 0x8} (ov006_core.h §VERIFIED). */
int func_ov006_021cadc8(int this_, int flag) {
    volatile unsigned long *reg = (volatile unsigned long *)0x04001000;
    if (flag) {
        unsigned long mode = (*reg & 0x1f00) >> 8;
        unsigned long base = *reg & ~0x1f00;
        *reg = base | ((mode | 0x4) << 8);
    } else {
        unsigned long mode = (*reg & 0x1f00) >> 8;
        unsigned long base = *reg & ~0x1f00;
        *reg = base | ((mode & ~0x4) << 8);
    }
    return 1;
}
