extern int *func_0202c93c(void);
extern void func_ov002_022b84c0(void *a, void *b, void *c);
extern void OS_SPrintf(char *buf, const char *fmt, ...);
extern int func_ov002_022a1784(void *p);
extern void Fill32(int v, void *dst, int n);
extern void func_020aadf8(char *dst, char *src);
extern void func_02022b74(void *p);
extern void func_0202cca4(int a);
extern void func_0202ce24(void);

extern char data_ov002_022d1b7c[];
extern char data_ov002_022ccbc8[];
extern char data_ov002_022d11bc[];
extern struct { char pad[0x54]; unsigned short flags; } data_02104bac;

void func_ov002_022b52e4(int *obj, int idx) {
    char name[0x20];
    char buf[0x3c];

    if (func_0202c93c()[0] == 0) {
        return;
    }
    if (idx >= 0) {
        func_ov002_022b84c0(data_ov002_022d1b7c, obj + 1, obj + 2);
    }
    if (idx >= 0 && idx != func_0202c93c()[1]) {
        OS_SPrintf(name, data_ov002_022ccbc8, idx);
        if (func_ov002_022a1784(data_ov002_022d11bc) != 0) {
            Fill32(0, buf, 0x3c);
            func_020aadf8(buf + 4, name);
            *(int *)(buf + 0x24) = obj[1];
            *(int *)(buf + 0x28) = obj[2];
            func_02022b74(buf);
        }
    }
    func_0202cca4(idx);
    if (data_02104bac.flags & 0x800) {
        func_0202ce24();
    }
}
