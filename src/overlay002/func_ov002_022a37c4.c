typedef struct {
    void *task;
    int f4;
    int f8;
    int fc;
    unsigned short f10;
    unsigned short f12;
    unsigned short flags;
    unsigned short f16;
    unsigned int f18;
    unsigned int a : 8;
    unsigned int b : 8;
    unsigned char pad[8];
} Obj;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void *func_02006c0c(void *entry, int a, int b);
extern void Task_Invoke(void *p);
extern char data_ov002_022cbe40[];
extern char data_ov002_022cbe58[];
void func_ov002_022a37c4(int *p) {
    Obj x;
    Obj y;
    void *task;
    p[0] = 0;
    p[1] = 0;
    p[2] = 0;
    task = func_02006c0c(data_ov002_022cbe40, 4, 0);
    func_0201d47c(&x);
    x.task = task;
    x.f8 = -1;
    x.fc = -1;
    x.flags = (x.flags & ~0xf) | 7;
    x.flags |= 0x10;
    x.f18 = (x.f18 & ~0x1c000) | 0x8000;
    x.f10 = 0x200;
    func_0201e5b8(&x);
    func_0201d47c(&x);
    x.f8 = -1;
    x.fc = -1;
    x.flags = (x.flags & ~0xf) | 8;
    x.flags |= 0x10;
    x.f18 = (x.f18 & ~0x1c000) | 0xc000;
    x.task = task;
    x.f10 = 0x200;
    func_0201e5b8(&x);
    Task_Invoke(x.task);
    task = func_02006c0c(data_ov002_022cbe58, 4, 0);
    func_0201d47c(&y);
    unsigned int flags = y.flags;
    y.f8 = -1;
    y.fc = -1;
    y.flags = (flags & ~0xf) | 9;
    y.flags |= 0x10;
    y.f18 &= ~0x1c000;
    y.task = task;
    y.f10 = 0xe00;
    func_0201e5b8(&y);
    Task_Invoke(y.task);
}





