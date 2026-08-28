/* func_0209d468: checks bit 15 of the halfword at a fixed system
 * RAM address (0x027fffa8, top-of-RAM reset-parameter mirror). If
 * set, retries func_0209ad68() via func_02093720(0xa3a47) while it
 * keeps returning 4; if the final result is 0, skip the "ok" path.
 * When ok, calls func_0209d394(1,1). Always finishes with
 * func_02093b08(). */

extern int func_0209ad68(void);
extern void func_02093720(int a0);
extern void func_0209d394(int a0, int a1);
extern void func_02093b08(void);

void func_0209d468(void) {
    int ok = 1;

    if ((*(unsigned short *)0x027fffa8 & 0x8000) >> 15) {
        int r = func_0209ad68();
        if (r == 4) {
            do {
                func_02093720(0xa3a47);
                r = func_0209ad68();
            } while (r == 4);
        }
        if (r == 0) {
            ok = 0;
        }
    }

    if (ok) {
        func_0209d394(1, 1);
    }
    func_02093b08();
}
