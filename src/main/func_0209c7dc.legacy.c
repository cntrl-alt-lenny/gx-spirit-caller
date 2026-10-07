extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02000b60(int a);
extern void func_02091a8c(void *queue);
extern void func_0209c31c(void (*cb)(void *));
extern void func_0209c8d0(void *core);

typedef struct {
    int *head;
    char pad4[0x1c - 4];
    int f1c;
    int f20;
    int f24;
    int f28;
    int f2c;
    int f30;
    int f34;
    int f38;
    int f3c;
    char pad40[0x104 - 0x40];
    int f104;
    char pad108[0x10c - 0x108];
    int queue[2];
    volatile unsigned int flags;
} Core;

typedef struct {
    int pad0;
    int f4;
} Other;

extern Core data_021a84c0;
extern Other data_021a63d0;

int func_0209c7dc(int a0, int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8) {
    Core *const p = &data_021a84c0;
    int irq;
    func_02000b60(0x02000c1c);
    irq = OS_DisableIrq();
    if (p->flags & 4) {
        do {
            func_02091a8c(p->queue);
        } while (p->flags & 4);
    }
    p->flags |= 4;
    p->f38 = a3;
    p->f3c = a4;
    OS_RestoreIrq(irq);
    p->f1c = a0;
    p->f20 = a1;
    p->f24 = a2;
    p->f2c = a6;
    p->f30 = a7;
    p->f34 = a8;
    if (a5 != 0) {
        func_0209c31c((void (*)(void *))func_0209c8d0);
        return 1;
    }
    data_021a84c0.f104 = data_021a63d0.f4;
    func_0209c8d0(p);
    if (*p->head == 0) {
        return 1;
    }
    return 0;
}
