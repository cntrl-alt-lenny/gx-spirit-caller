/* func_02052870: bail out (0) unless a global-ready check and a
 * per-a0 gate both pass and a2 fits under a configured limit; run
 * func_02052298, then fire an optional callback stored in the
 * data_0219e30c table before returning 1.
 */

extern int func_02045230(void);
extern int func_02046964(int a0);
extern void func_02052298(void *self, int a, int b, int c);
extern char *data_0219e30c;

int func_02052870(void *a0, int a1, int a2) {
    unsigned short lim;
    void (*cb)(int, void *);

    if (func_02045230() != 0) {
        return 0;
    }
    if (func_02046964((int)a0) == 0) {
        return 0;
    }
    lim = *(unsigned short *)(data_0219e30c + 0x600 + 0x10);
    if (a2 > lim) {
        return 0;
    }
    func_02052298(a0, a1, a2, 0);
    cb = *(void (**)(int, void *))(data_0219e30c + 0x600);
    if (cb != 0) {
        cb(a2, a0);
    }
    return 1;
}
