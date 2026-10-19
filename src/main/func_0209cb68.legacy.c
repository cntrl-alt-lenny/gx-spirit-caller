extern int func_0209c0a0(void);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a8c(void *);
extern void func_02093d44(int);
extern int func_0209cea4(void *);
extern void func_0209cad8(void *);
extern void func_0209c31c(int);
extern void func_0209cc90(void *);
typedef struct { char p0[0x1c]; int b,c,d,a; char p2c[0xc]; int e,f; char p40[0xc4]; int owner; char p108[4]; char queue[8]; int flags; } Core;
extern Core data_021a84c0;
extern int data_021a8ae0;
extern char data_021a8b00[];
extern int data_021a63d0[];
void func_0209cb68(unsigned int a, int b, int c, int d, int e, int f, int g) {
    Core *const base = &data_021a84c0;
    void *request = data_021a8b00;
    int saved;
    int flags;
    func_0209c0a0();
    saved = OS_DisableIrq();
    flags = base->flags;
    while (flags & 4) {
        func_02091a8c(base->queue);
        flags = base->flags;
    }
    base->flags |= 4;
    base->e = e;
    base->f = f;
    OS_RestoreIrq(saved);
    base->a = a;
    base->b = b + data_021a8ae0;
    base->c = c;
    base->d = d;
    if (a <= 3) func_02093d44(a);
    if (func_0209cea4(request)) {
        if (g) return;
        func_0209cad8((void *)g);
        return;
    }
    if (g) {
        func_0209c31c((int)func_0209cc90);
        return;
    }
    base->owner = data_021a63d0[1];
    func_0209cc90(base);
}








