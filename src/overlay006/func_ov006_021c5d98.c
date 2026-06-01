/* func_ov006_021c5d98: set/clear one bit of the MAIN-engine DISPCNT display-
 * mode field (bits 12:8) per the flag arg, preserving the rest of the field.
 * Returns 1. Main-engine toggle family; leaf, toggled bit 0x2. Sibling of
 * 021c1770 / 021c6fa0 (ov006_core.h). */
int func_ov006_021c5d98(int this_, int on) {
    volatile unsigned long *reg = (volatile unsigned long *)0x04000000;
    if (on) {
        unsigned long mode = (*reg & 0x1f00) >> 8;
        unsigned long base = *reg & ~0x1f00;
        *reg = base | ((mode | 0x2) << 8);
    } else {
        unsigned long mode = (*reg & 0x1f00) >> 8;
        unsigned long base = *reg & ~0x1f00;
        *reg = base | ((mode & ~0x2) << 8);
    }
    return 1;
}
