/* func_020528e4: bail out (0) unless a global-ready check and a
 * per-a0 gate both pass and a2 fits under a configured limit; run
 * func_0205230c, then fire an optional callback stored in the
 * data_0219e3ec table before returning 1.
 */

extern int func_02045280(void);
extern int func_020469d0(int a0);
extern void func_0205230c(void *self, int a, int b, int c);
extern char *data_0219e3ec;

int func_020528e4(void *a0, int a1, int a2) {
    unsigned short lim;
    void (*cb)(int, void *);

    if (func_02045280() != 0) {
        return 0;
    }
    if (func_020469d0((int)a0) == 0) {
        return 0;
    }
    lim = *(unsigned short *)(data_0219e3ec + 0x600 + 0x10);
    if (a2 > lim) {
        return 0;
    }
    func_0205230c(a0, a1, a2, 0);
    cb = *(void (**)(int, void *))(data_0219e3ec + 0x600);
    if (cb != 0) {
        cb(a2, a0);
    }
    return 1;
}
