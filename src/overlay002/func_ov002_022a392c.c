typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    void *task;
    int f4, f8, fc;
    short f10, f12;
    u16 flags, f16;
    u32 f18;
    u32 a:8, b:8;
    char pad[8];
} Obj;
struct Mtx22 { int _[4]; };
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void *func_02006c0c(void *, int, int);
extern void Task_Invoke(void *);
extern void func_0208b0f0(int, int, int);
extern void func_0208c8cc(u32, u32, u32);
extern int func_0208cf44(void);
extern int func_0208cf58(void);
extern void func_0208da2c(int);
extern int func_0208e014(void);
extern int func_0208e120(void);
extern void func_02094504(int, int, unsigned int);
extern int OS_SPrintf(signed char *, const signed char *, ...);
extern void G2x_SetBGyAffine_(u32, const struct Mtx22 *, int, int, int, int);
extern void func_ov002_022a57b8(int *, unsigned int, int);
extern signed char data_ov002_022cbe74[], data_ov002_022cbe8c[], data_ov002_022cbea4[], data_ov002_022cbebc[];
extern char data_ov002_022d0fb4[], data_ov002_022d0fc4[];
extern struct { char pad[0xb88]; int mode; int fB8c; int index; } data_021040ac;
typedef enum { MODE_FALSE, MODE_TRUE } ModeBool;
static inline int IsSpecialMode(int mode) { return mode == 1 || mode == 2; }
void func_ov002_022a392c(int *p) {
    signed char buf[32];
    Obj o;
    struct Mtx22 m;
    void *t1, *t2;
    if (data_021040ac.mode == 2) {
        t1 = func_02006c0c(data_ov002_022cbe74, 4, 0);
        t2 = func_02006c0c(data_ov002_022cbe8c, 4, 0);
    } else if ((ModeBool)IsSpecialMode(data_021040ac.mode)) {
        t1 = func_02006c0c(data_ov002_022cbea4, 4, 0);
        OS_SPrintf(buf, data_ov002_022cbebc, data_021040ac.index + 1);
        t2 = func_02006c0c(buf, 4, 0);
    } else {
        func_ov002_022a57b8(p, 2, 0);
        return;
    }
    func_0208cf58();
    func_0208cf44();
    func_0208da2c(0x60);
    func_0208c8cc(1, 5, 1);
    *(volatile u16 *)0x0400000c = (*(volatile u16 *)0x0400000c & ~3) | 1;
    *(volatile u16 *)0x0400000c = (*(volatile u16 *)0x0400000c & 0x43) | 0x4700;
    func_02094504(0, func_0208e120(), 0x800);
    *(volatile u16 *)0x0400000e &= ~3;
    *(volatile u16 *)0x0400000e = (*(volatile u16 *)0x0400000e & 0x43) | 0x4f04;
    func_02094504(0, func_0208e014(), 0x800);
    func_0201d47c(&o);
    o.task = t1;
    o.flags = (o.flags & ~0xf) | 2;
    o.f8 = 0;
    o.fc = 0;
    o.f10 = 0;
    func_0201e5b8(&o);
    func_0201d47c(&o);
    o.task = t2;
    o.flags = (o.flags & ~0xf) | 3;
    o.f8 = 0;
    o.fc = 0;
    o.f10 = -1;
    func_0201e5b8(&o);
    Task_Invoke(t1);
    Task_Invoke(t2);
    *(u16 *)0x05000000 = 0;
    { u32 display = *(volatile u32 *)0x04000000 & ~0x1f00; *(volatile u32 *)0x04000000 = display; }
    func_0208b0f0((int)&m, 0x800, 0x800);
    G2x_SetBGyAffine_((u32)data_ov002_022d0fb4, &m, 128, 20, 0, -56);
    G2x_SetBGyAffine_((u32)data_ov002_022d0fc4, &m, 128, 20, 0, -96);
}














