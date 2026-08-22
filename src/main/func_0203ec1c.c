/* func_0203ec1c: if func_0207b5f8()'s state isn't 1, bail returning 1.
 * Otherwise build a 4-word record from the shared scratch object's
 * d0a byte, reset the display (func_0203e254, my own func_0203e254.c),
 * and submit it via func_0207bfd4 with func_0203d524 as callback;
 * result 1 or >=4 triggers func_0203c85c(1) and returns 0x11, else 2. */
extern int  func_0207b5f8(void);
extern void *func_0203c900(int a);
extern int  func_0203e254(int a0);
extern int  func_0207bfd4(void *buf, void *cb);
extern void func_0203d524(void *p);
extern void func_0203c85c(int a);

int func_0203ec1c(void) {
    int state = func_0207b5f8();
    void *base = func_0203c900(0x10);
    if (state == 1) {
        int rec[4];
        rec[0] = ((unsigned char *)base)[0xd0a];
        rec[1] = 0;
        rec[2] = 0;
        rec[3] = 0;
        func_0203e254(0);
        int r = func_0207bfd4(rec, (void *)func_0203d524);
        if (r == 1 || r >= 4) {
            func_0203c85c(1);
            return 0x11;
        }
    } else {
        return 1;
    }
    return 2;
}
