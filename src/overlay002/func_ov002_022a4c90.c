typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    void *task;
    int f4, f8, fc;
    short f10, f12; u16 bg:4, enable:1, unused:11; u16 f16;
    u32 low:14, bank:3, high:15;
    u32 a:8, b:8;
    char pad[8];
} Obj;
struct Mtx22 { int _[4]; };
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void *func_02006c0c(void *, int, int);
extern void Task_Invoke(void *);
extern int func_02037208(int, int, int, int);
extern void func_0208b0f0(int, int, int);
extern void func_0208c8b0(unsigned int);
extern int func_0208df94(void);
extern int func_0208e0a0(void);
extern void func_02094504(int, int, unsigned int);
extern int OS_SPrintf(char *, const char *, ...);
extern void G2x_SetBGyAffine_(u32, const struct Mtx22 *, int, int, int, int);
extern char data_ov002_022cbf68[];
extern char data_ov002_022d0fd4[];
extern char data_ov002_022d0fe4[];
extern struct { int f0; u32 :3; u32 mode:2; u32 :27; } data_02104f4c;
void func_ov002_022a4c90(int *p) {
    char buf[32];
    Obj o;
    struct Mtx22 m;

    int mode, x, y;
    func_0208c8b0(5);
    *(volatile u16 *)0x0400100c &= ~3;
    *(volatile u16 *)0x0400100c = (*(volatile u16 *)0x0400100c & 0x43) | 0x5e10;
    func_02094504(0, func_0208e0a0(), 0x800);
    *(volatile u16 *)0x0400100e &= ~3;
    *(volatile u16 *)0x0400100e = (*(volatile u16 *)0x0400100e & 0x43) | 0x5f18;
    func_02094504(0, func_0208df94(), 0x800);
    OS_SPrintf(buf, data_ov002_022cbf68, p[1]);
    func_0201d47c(&o);
    o.task = func_02006c0c(buf, 4, 0);
    o.bg = 7;
    o.f8 = 0;
    o.fc = 0;
    o.enable = 1;
    o.bank = 7;
    o.f10 = 0x200;
    func_0201e5b8(&o);
    Task_Invoke(o.task);
    OS_SPrintf(buf, data_ov002_022cbf68, 1-p[1]);
    func_0201d47c(&o);
    o.task = func_02006c0c(buf, 4, 0);
    o.bg = 8;
    o.f8 = 0;
    o.fc = 0;
    o.enable = 1;
    o.bank = 7;
    o.f10 = 0x200;
    func_0201e5b8(&o);
    Task_Invoke(o.task);
    mode = (int)data_02104f4c.mode;
    x = mode % 2 ? -12 : 12;
    y = mode / 2 ? 72 : 88;
    func_0208b0f0((u32)&m, 0x1000, 0x1000);
    G2x_SetBGyAffine_((u32)data_ov002_022d0fd4, &m, 128, 16, -x, -y);
    {
    func_0208b0f0((int)&m, 0x2000, 0x2000);
    G2x_SetBGyAffine_((u32)data_ov002_022d0fe4, &m, 128, 16, -x, -y);
    }
    func_02037208(0x89, -1, 0, 1);
}





