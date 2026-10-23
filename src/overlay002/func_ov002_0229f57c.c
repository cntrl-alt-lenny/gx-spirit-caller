typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct { void *task; int f4; int f8; int fc; short f10; u16 f12; unsigned short kind:4; unsigned short enable:1; unsigned short rest:11; u16 f16; unsigned int lo:14; unsigned int mode:3; unsigned int hi:15; char tail[12]; } Desc;
extern int func_0201d47c(Obj *o);
extern void *func_02006c0c(void *, int, int);
extern int func_0201e5b8(Desc *);
extern void Task_Invoke(void *p);
extern void func_0208ff84(void *a, int b, u32 n);
extern void *data_ov002_022cbab4[];
extern char data_ov002_022cbb70[], data_ov002_022cbb8c[], data_020b4728[];
typedef struct { int f0; char pad4[0x64]; int f68; int f6c; int f70; char pad74[0x120]; int f194; struct { int f0; char gap[20]; int f18; int f1c; } arr[3]; } Self;
void func_ov002_0229f57c(Self *self) {
    Desc a, b, c;
    unsigned int i;
    int j;
    void *task;
    self->f0 = 0;
    self->f68 = 0;
    self->f70 = 0;
    self->f194 = 0;
    for (j=0; j<3; j++) {
        self->arr[j].f0=0;
        self->arr[j].f18=0;
    }
    for (i=0;i<6;i++) {
        func_0201d47c((Obj *)&a);
        a.task=func_02006c0c(data_ov002_022cbab4[i],4,0);
        a.kind=8;
        a.mode=3;
        a.f8=-1;
        a.fc=-1;
        a.f10=(i+2)<<9;
        a.enable=1;
        func_0201e5b8(&a);
        a.kind=7;
        a.f10=(i+2)<<9;
        a.mode=2;
        func_0201e5b8(&a);
        Task_Invoke(a.task);
    }
    task=func_02006c0c(data_ov002_022cbb70,4,0);
    func_0201d47c((Obj *)&b);
    b.task=task;
    b.kind=9;
    b.fc=-1;
    b.enable=1;
    b.f10=0xa00;
    func_0201e5b8(&b);
    Task_Invoke(task);
    func_0201d47c((Obj *)&c);
    c.task=func_02006c0c(data_ov002_022cbb8c,4,0);
    c.kind=7;
    c.f8=-1;
    c.fc=-1;
    c.mode=2;
    c.f10=0;
    c.enable=1;
    func_0201e5b8(&c);
    c.kind=9;
    c.mode=0;
    c.f10=0xc00;
    func_0201e5b8(&c);
    Task_Invoke(c.task);
    func_0208ff84(data_020b4728,0,0x20);
}











