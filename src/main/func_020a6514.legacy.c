typedef struct Msg {
    int (*fn0)(struct Msg *);
    void (*fn1)(struct Msg *);
    int result;
    int pad[6];
} Msg;

typedef struct Ctx {
    char pad[0xc0];
    Msg *volatile msg;
} Ctx;

typedef struct Flags {
    char pad[0x22];
    char flag;
} Flags;

extern Flags data_021a9b0c;
extern int data_021a9b08;

extern void func_020945f4(void *dst, int val, int size);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a8c(int);
extern void func_02091cf8(void);

void func_020a6514(Ctx *ctx)
{
    Msg m;
    int irq;
    for (;;) {
        func_020945f4(&m, 0, 0x24);
        irq = OS_DisableIrq();
        while (ctx->msg == 0) {
            func_02091a8c(0);
        }
        m = *ctx->msg;
        OS_RestoreIrq(irq);
        if (m.fn0 != 0) {
            m.result = m.fn0(&m);
        }
        irq = OS_DisableIrq();
        data_021a9b0c.flag = 0;
        if (m.fn1 != 0) {
            m.fn1(&m);
        }
        if (data_021a9b08 == 0) break;
        ctx->msg = 0;
        OS_RestoreIrq(irq);
    }
    func_02091cf8();
}
