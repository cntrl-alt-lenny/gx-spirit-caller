#pragma thumb on
extern char data_ov004_0220a2f8[];
extern char data_ov004_0229161c[];
extern void func_ov004_021dbe68(void *p, void *q, int n);
extern int func_ov004_021dbd08(void *p);
extern int func_ov004_021dc020(void *p, int n, void *q, int x);
extern unsigned func_ov004_021dbd1c(int x);
extern int func_ov004_021dcd1c(int a, void *b);
extern void *func_ov004_021de250(int n);
extern void func_ov004_021de23c(void *p);
extern int func_ov004_021dc238(void *a, void *b, int c, int d, void *e, void *f, int g);
extern int func_ov004_021dbd6c(int x);
extern int func_ov004_021dd584(void);
extern void func_ov004_021dd590(int x);
int func_ov004_021dcd64(char *arg0) {
    char *q = arg0 + 24;
    char buf[8];
    int v, len;
    void *mem;
    func_ov004_021dbe68(buf, arg0 + 16, 8);
    if (func_ov004_021dc020(buf, 8, data_ov004_0220a2f8, func_ov004_021dbd08(data_ov004_0220a2f8)) == -1) {
        func_ov004_021dd590(2);
        return ~99;
    }
    v = func_ov004_021dcd1c(func_ov004_021dbd1c(*(unsigned short *)(arg0 + 6)), buf);
    if (v != 0) return v;
    if (func_ov004_021dbd1c(*(unsigned short *)(arg0 + 6)) == 0x1000)
        func_ov004_021dbe68(data_ov004_0229161c, buf, 8);
    if ((func_ov004_021dbd1c(*(unsigned short *)(arg0 + 12)) & 15) == 0)
        return 0;
    len = func_ov004_021dbd1c(*(unsigned short *)q);
    mem = func_ov004_021de250(len);
    if (mem == 0) {
        func_ov004_021dd590(2);
        return 100;
    }
    if (func_ov004_021dc238(q + 4, mem, len, *(unsigned char *)(arg0 + 14), q + 2, data_ov004_0229161c, 8) < 0) {
        func_ov004_021de23c(mem);
        if (func_ov004_021dd584() == 2) return 100;
        return 200;
    }
    func_ov004_021dbe68(q, mem, len);
    *(short *)(arg0 + 10) = func_ov004_021dbd6c((unsigned short)len);
    func_ov004_021de23c(mem);
    return 0;
}
