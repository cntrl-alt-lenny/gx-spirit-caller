#pragma thumb on
extern char data_ov004_0220a098[];
extern char data_ov004_022913bc[];
extern void func_ov004_021dbc54(void *p, void *q, int n);
extern int func_ov004_021dbaf4(void *p);
extern int func_ov004_021dbe0c(void *p, int n, void *q, int x);
extern unsigned func_ov004_021dbb08(int x);
extern int func_ov004_021dcb08(int a, void *b);
extern void *func_ov004_021de03c(int n);
extern void func_ov004_021de028(void *p);
extern int func_ov004_021dc024(void *a, void *b, int c, int d, void *e, void *f, int g);
extern int func_ov004_021dbb58(int x);
extern int func_ov004_021dd370(void);
extern void func_ov004_021dd37c(int x);
int func_ov004_021dcb50(char *arg0) {
    char *q = arg0 + 24;
    char buf[8];
    int v, len;
    void *mem;
    func_ov004_021dbc54(buf, arg0 + 16, 8);
    if (func_ov004_021dbe0c(buf, 8, data_ov004_0220a098, func_ov004_021dbaf4(data_ov004_0220a098)) == -1) {
        func_ov004_021dd37c(2);
        return ~99;
    }
    v = func_ov004_021dcb08(func_ov004_021dbb08(*(unsigned short *)(arg0 + 6)), buf);
    if (v != 0) return v;
    if (func_ov004_021dbb08(*(unsigned short *)(arg0 + 6)) == 0x1000)
        func_ov004_021dbc54(data_ov004_022913bc, buf, 8);
    if ((func_ov004_021dbb08(*(unsigned short *)(arg0 + 12)) & 15) == 0)
        return 0;
    len = func_ov004_021dbb08(*(unsigned short *)q);
    mem = func_ov004_021de03c(len);
    if (mem == 0) {
        func_ov004_021dd37c(2);
        return 100;
    }
    if (func_ov004_021dc024(q + 4, mem, len, *(unsigned char *)(arg0 + 14), q + 2, data_ov004_022913bc, 8) < 0) {
        func_ov004_021de028(mem);
        if (func_ov004_021dd370() == 2) return 100;
        return 200;
    }
    func_ov004_021dbc54(q, mem, len);
    *(short *)(arg0 + 10) = func_ov004_021dbb58((unsigned short)len);
    func_ov004_021de028(mem);
    return 0;
}
