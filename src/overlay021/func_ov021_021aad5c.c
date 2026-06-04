/* func_ov021_021aad5c: record the flag at +0x40, then set/clear BG3 (bit 0x8) of
 * the SUB-engine DISPCNT display-mode field per the flag, preserving the rest.
 * Returns 1. Sub-engine toggle family (ov006 family E recipe). (ov021_core.h) */
int func_ov021_021aad5c(void *o, int on) {
    *(int *)((char *)o + 0x40) = on;
    {
        volatile unsigned long *reg = (volatile unsigned long *)0x04001000;
        if (on) {
            unsigned long mode = (*reg & 0x1f00) >> 8;
            unsigned long base = *reg & ~0x1f00;
            *reg = base | ((mode | 0x8) << 8);
        } else {
            unsigned long mode = (*reg & 0x1f00) >> 8;
            unsigned long base = *reg & ~0x1f00;
            *reg = base | ((mode & ~0x8) << 8);
        }
        return 1;
    }
}
