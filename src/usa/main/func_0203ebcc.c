/* func_0203ebcc: if func_0207b510()'s state isn't 1, bail returning 1.
 * Otherwise build a 4-word record from the shared scratch object's
 * d0a byte, reset the display (func_0203e204, my own func_0203e204.c),
 * and submit it via func_0207beec with func_0203d4d4 as callback;
 * result 1 or >=4 triggers func_0203c80c(1) and returns 0x11, else 2. */
extern int  func_0207b510(void);
extern void *func_0203c8b0(int a);
extern int  func_0203e204(int a0);
extern int  func_0207beec(void *buf, void *cb);
extern void func_0203d4d4(void *p);
extern void func_0203c80c(int a);

int func_0203ebcc(void) {
    int state = func_0207b510();
    void *base = func_0203c8b0(0x10);
    if (state == 1) {
        int rec[4];
        rec[0] = ((unsigned char *)base)[0xd0a];
        rec[1] = 0;
        rec[2] = 0;
        rec[3] = 0;
        func_0203e204(0);
        int r = func_0207beec(rec, (void *)func_0203d4d4);
        if (r == 1 || r >= 4) {
            func_0203c80c(1);
            return 0x11;
        }
    } else {
        return 1;
    }
    return 2;
}
