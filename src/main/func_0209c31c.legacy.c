extern void func_0209181c(void *thread, int a);
extern void func_020919d8(void *thread);

typedef struct {
    char pad0[0x40];
    int f40;
    char thread[0x104 - 0x44];
    void *f104;
    int f108;
    char pad10c[0x114 - 0x10c];
    unsigned int flags;
} Core;

extern Core data_021a84c0;

void func_0209c31c(int a) {
    Core *const c = &data_021a84c0;
    func_0209181c(c->thread, c->f108);
    c->f104 = c->thread;
    c->f40 = a;
    c->flags |= 8;
    func_020919d8(c->thread);
}
