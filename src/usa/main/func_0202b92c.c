/* func_0202b92c: clone of 0202b8f0 with shift 0x1 + saturate-to-0xffff
 * variant.
 */

extern unsigned int *func_0202b2c8(void);

int func_0202b92c(void) {
    unsigned int v = *func_0202b2c8();
    unsigned int field = (v << 0x1) >> 0x17;
    if (field == 0x1ff) return 0xffff;
    return (int)field * 10;
}
