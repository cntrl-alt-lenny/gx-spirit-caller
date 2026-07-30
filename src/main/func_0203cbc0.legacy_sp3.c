/* func_0203cbc0: classify func_0203c888()'s status byte into a small
 * category code via a sequence of unsigned range/equality checks,
 * falling through to func_0203de2c() (tail call) for anything unmatched. */

extern int func_0203c888(void);
extern int func_0203de2c(void);

int func_0203cbc0(void) {
    unsigned int r = func_0203c888();
    if (r <= 1) return 0;
    if (r < 7) return 1;
    if (r == 9) return 4;
    if (r < 0xa) return 2;
    if (r == 0xb) return 4;
    if (r < 0x10) return 3;
    if (r == 0x10) return 5;
    if (r == 0x11) return 4;
    return func_0203de2c();
}
