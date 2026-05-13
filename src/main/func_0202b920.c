/* func_0202b920: clone of 0202b8f0 with shift 0x1 instead of 0xa
 * (extracts bits 22..30 instead of 13..21).
 */

extern unsigned int *func_0202b31c(void);

int func_0202b920(void) {
    unsigned int v = *func_0202b31c();
    unsigned int field = (v << 0x1) >> 0x17;
    if (field == 0x1ff) return 0;
    return (int)field * 10;
}
