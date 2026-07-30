#pragma thumb on

extern char data_ov004_02291618[];
extern char data_ov004_0229161c[];
extern char data_ov004_0220a2f8[];
extern void func_ov004_021dbe5c(void *p, int v, int n);
extern void func_ov004_021dbe68(void *p, void *q, int n);
extern int func_ov004_021dc020(void *p, int n, void *q, int x);
extern int func_ov004_021dc474(void *p);
extern int func_ov004_021dbd6c(int x);
extern void func_ov004_021dc418(int a0, short *a1, int a2, short *a3, unsigned short *a4, int a5);
extern void func_ov004_021dc3b8(void *a, int b, int c, int d, int e, int f, void *g);
extern void func_ov004_021dc350(void *a, int b, int c, int d);
extern void func_ov004_021dd590(int x);
extern void func_ov004_021de23c(void *p);
extern void *func_ov004_021de250(int n);

int func_ov004_021dc664(int arg0, void *arg1, int arg2) {
    struct {
        char flag0;
        short field2;
        short field4;
        char buf16[8];
    } local;
    char *buf;
    void *obj;
    short *p18;

    local.flag0 = 0;
    local.field2 = 0;
    local.field4 = 0;

    buf = *(char **)data_ov004_02291618;
    func_ov004_021dbe5c(buf, 0, 1500);

    obj = func_ov004_021de250(0x210);
    if (obj == 0) {
        func_ov004_021dd590(2);
        return -1;
    }
    func_ov004_021dbe5c(obj, 0, 0x210);

    p18 = (short *)(buf + 0x18);
    func_ov004_021dbe68(data_ov004_0229161c, arg1, 8);
    func_ov004_021dbe68(local.buf16, data_ov004_0229161c, 8);

    local.field2 = (short)func_ov004_021dc474((char *)obj + 4);
    if (local.field2 < 0) {
        func_ov004_021dd590(3);
        if (obj != 0) {
            func_ov004_021de23c(obj);
        }
        return -1;
    }

    *(char *)obj = 0;
    *(short *)((char *)obj + 2) = (short)func_ov004_021dbd6c((unsigned short)local.field2);
    local.field2 = (short)(local.field2 + 4);

    func_ov004_021dc418(0, p18, (int)obj, &local.field2, (unsigned short *)&local.field4, (int)&local);

    local.field4 = (short)(local.field4 | 0x10);

    if (func_ov004_021dc020(local.buf16, 8, data_ov004_0220a2f8, 6) != 0) {
        func_ov004_021dd590(2);
        if (obj != 0) {
            func_ov004_021de23c(obj);
        }
        return -1;
    }

    func_ov004_021dc3b8(buf, 0x1000, local.field2, local.field4, local.flag0, 0x11, local.buf16);
    local.field2 = (short)(local.field2 + 0x18);
    func_ov004_021dc350(buf, local.field2, 0xff, arg2);
    if (obj != 0) {
        func_ov004_021de23c(obj);
    }
    return 0;
}
