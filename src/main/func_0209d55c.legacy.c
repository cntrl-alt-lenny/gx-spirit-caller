/* func_0209d55c: checks bit 15 of the halfword at a fixed system
 * RAM address (0x027fffa8, top-of-RAM reset-parameter mirror). If
 * set, retries func_0209ae5c() via func_02093814(0xa3a47) while it
 * keeps returning 4; if the final result is 0, skip the "ok" path.
 * When ok, calls func_0209d488(1,1). Always finishes with
 * func_02093bfc(). */

extern int func_0209ae5c(void);
extern void func_02093814(int a0);
extern void func_0209d488(int a0, int a1);
extern void func_02093bfc(void);

void func_0209d55c(void) {
    int ok = 1;

    if ((*(unsigned short *)0x027fffa8 & 0x8000) >> 15) {
        int r = func_0209ae5c();
        if (r == 4) {
            do {
                func_02093814(0xa3a47);
                r = func_0209ae5c();
            } while (r == 4);
        }
        if (r == 0) {
            ok = 0;
        }
    }

    if (ok) {
        func_0209d488(1, 1);
    }
    func_02093bfc();
}
