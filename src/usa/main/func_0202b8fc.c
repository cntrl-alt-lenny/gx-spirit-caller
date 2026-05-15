/* func_0202b8fc: clone of 0202b8f0 with saturate-to-0xffff variant.
 * When field == 0x1ff, returns 0x1ff + 0xfe00 = 0xffff (addeq form).
 */

extern unsigned int *func_0202b2c8(void);

int func_0202b8fc(void) {
    unsigned int v = *func_0202b2c8();
    unsigned int field = (v << 0xa) >> 0x17;
    if (field == 0x1ff) return 0xffff;
    return (int)field * 10;
}
