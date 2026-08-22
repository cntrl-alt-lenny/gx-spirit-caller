/* func_0202d4a8: format a card value via a lookup table, submit a command
 * record (0201e5b8 family, see ov006_core.h) built around it, and invoke
 * the resulting task. Sibling of func_0202d3c4 (same buf[0x48]/cmd shape). */
extern short data_020be9e8[];
extern char  data_020c6d28[];
extern void  OS_SPrintf(char *buf, const char *fmt, ...);
extern void  func_0201d47c(void *p);
extern int   func_02006c0c(char *s, int a, int b);
extern void  func_0201e5b8(void *p);
extern void  Task_Invoke(int task);

struct S0219ad48 {
    char pad[0x6c];
    int  field_6c;
};
extern struct S0219ad48 data_0219ad48;

void func_0202d4a8(int a0, int a1) {
    char buf[0x48];
    short v = data_020be9e8[a1];
    OS_SPrintf(buf + 0x28, data_020c6d28, v);
    func_0201d47c(buf);
    *(int *)buf = func_02006c0c(buf + 0x28, 4, 0);
    {
        unsigned short ip = *(unsigned short *)(buf + 0x14);
        unsigned short trunc = (unsigned short)data_0219ad48.field_6c;
        ip = (ip & ~0xf) | (trunc & 0xf);
        *(unsigned short *)(buf + 0x14) = ip;
        *(int *)(buf + 8) = -1;
        *(int *)(buf + 0xc) = ((a0 << 2) + 0xf + 0x100) << 5;
        *(unsigned short *)(buf + 0x10) = (unsigned short)((a0 + 6) << 5);
    }
    func_0201e5b8(buf);
    Task_Invoke(*(int *)buf);
}
