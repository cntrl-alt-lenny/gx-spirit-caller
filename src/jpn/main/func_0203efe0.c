/* func_0203efe0: allocate two handles, feed them plus the caller's
 * object into func_0203ed84's table lookup/fanout, poke a global
 * constant, then validate the second handle -- returning a status
 * code that depends on validation success. */

extern void *func_0203c8b0(int a0);
extern void func_0203ed84(void *a0, void *a1, void *a2);
extern int func_0206e748(void *a0);
extern void func_0203c80c(int a0);

extern int data_0219ebfc;

int func_0203efe0(void *a0) {
    void *h1 = func_0203c8b0(1);
    void *h4 = func_0203c8b0(4);

    func_0203ed84(h1, a0, h4);
    data_0219ebfc = 4;

    if (func_0206e748(h4) == 0) {
        return 0xc;
    }

    func_0203c80c(2);
    return 0x11;
}
