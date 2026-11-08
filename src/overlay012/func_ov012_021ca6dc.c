typedef struct {
    void *task;
    int f4, f8, fc;
    unsigned short f10, f12;
    unsigned short mode:4;
    unsigned short enable:1;
    unsigned short rest14:11;
    unsigned short rest16:14;
    unsigned short flag16:1;
    unsigned short top16:1;
    unsigned x:7;
    unsigned y:7;
    unsigned type:3;
    unsigned rest18:15;
    unsigned a:8;
    unsigned b:8;
    unsigned rest1c:16;
    int f20;
    unsigned short c:8;
    unsigned short d:8;
    unsigned short e:8;
    unsigned short f:8;
} Obj;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void Task_Invoke(void *p);
extern void func_ov000_021ab4bc(int idx, int val);
extern void func_0208c8cc(unsigned int a, unsigned int b, unsigned int c);
extern char data_ov012_021cc6a0[];
extern char data_ov012_021cc6dc[];
void func_ov012_021ca6dc(void) {
    char *base = data_ov012_021cc6dc;
    Obj o;
    if (*(int *)(data_ov012_021cc6a0 + 0x1c0) == 0) return;
    func_0201d47c(&o);
    o.mode = 0;
    o.task = *(void **)(base + 0x184);
    o.f8 = 0;
    o.fc = 0;
    o.f10 = 0x200;
    o.enable = 1;
    o.x = 0;
    o.y = 0;
    o.type = 2;
    if (*(int *)(base + 0x15c) == 1) {
        o.mode = 0;
        o.b = 0x40;
        o.c = 0;
        o.e = 0x40;
        o.a = 0x40;
        o.d = 0;
        o.f = 0x40;
        o.flag16 = 1;
        o.enable = 0;
        o.f10 = 0;
    }
    func_0201e5b8(&o);
    Task_Invoke(o.task);
    *(void **)(base + 0x184) = 0;
    func_ov000_021ab4bc(0, 1);
    func_0208c8cc(1, 0, 0);
}



