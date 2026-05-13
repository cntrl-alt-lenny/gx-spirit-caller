/* func_0202b980: clone of 0202b8f0 with shift 0x1 + saturate-to-0xffff
 * variant.
 */

extern unsigned int *func_0202b31c(void);

int func_0202b980(void) {
    unsigned int v = *func_0202b31c();
    unsigned int field = (v << 0x1) >> 0x17;
    if (field == 0x1ff) return 0xffff;
    return (int)field * 10;
}
