/* func_0203f030: allocate two handles, feed them plus the caller's
 * object into func_0203edd4's table lookup/fanout, poke a global
 * constant, then validate the second handle -- returning a status
 * code that depends on validation success. */

extern void *func_0203c900(int a0);
extern void func_0203edd4(void *a0, void *a1, void *a2);
extern int func_0206e7bc(void *a0);
extern void func_0203c85c(int a0);

extern int data_0219ecdc;

int func_0203f030(void *a0) {
    void *h1 = func_0203c900(1);
    void *h4 = func_0203c900(4);

    func_0203edd4(h1, a0, h4);
    data_0219ecdc = 4;

    if (func_0206e7bc(h4) == 0) {
        return 0xc;
    }

    func_0203c85c(2);
    return 0x11;
}
