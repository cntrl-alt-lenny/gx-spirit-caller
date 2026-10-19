typedef struct Task Task;
struct Task {
    Task *next;
    unsigned int flags;
    void (*run)(Task *);
    void (*done)(Task *);
};
typedef struct {
    char pad[0xc0];
    Task * volatile head;
    Task sentinel;
} Context;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_02091814(void *p);
extern int func_0209181c(char *a0, void *a1);
extern void func_02091a8c(void *q);
extern void func_02091cf8(void);
void func_020a591c(Context *ctx) {
    Task *task;
    int saved;
    int saved2;
    void (*done)(Task *);
    unsigned int current;
    unsigned int desired;

    for (;;) {
        saved = OS_DisableIrq();
        while (ctx->head == 0) {
            func_0209181c((char *)ctx, 0);
            func_02091a8c(0);
        }
        task = ctx->head;
        ctx->head = ctx->head->next;
        func_0209181c((char *)ctx, (void *)(task->flags >> 1));
        OS_RestoreIrq(saved);
        if (task->run != 0) task->run(task);
        saved2 = OS_DisableIrq();
        done = task->done;
        current = func_02091814(ctx);
        if (ctx->head == 0) desired = 0;
        else if (current < (ctx->head->flags >> 1)) desired = ctx->head->flags >> 1;
        else desired = current;
        if (desired != current) func_0209181c((char *)ctx, (void *)desired);
        task->next = 0;
        task->flags &= ~1u;
        if (done != 0) done(task);
        if (task == &ctx->sentinel) break;
        OS_RestoreIrq(saved2);
    }
    func_02091cf8();
}


