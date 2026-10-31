typedef struct Container { void *head; void *f04; } Container;
typedef struct { char pad[0x64]; unsigned int flag; } ctx_020919d8_t;
typedef struct {
    int *head;
    char pad04[0x34];
    void (*callback)(void *);
    void *argument;


    char pad40[4];
    ctx_020919d8_t thread;
    char padac[0x60];
    Container queue;
    unsigned int flags;
} Core;
extern Core data_021a84c0;
extern char data_021a8b00[];
extern int func_0209d1f0(char *arg0);
extern unsigned int func_0209cd3c(void);
extern void func_0209d4ec(unsigned int value);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02091a0c(Container *c);
extern void func_020919d8(ctx_020919d8_t *ctx);
void func_0209cc90(void) {
    char *request = data_021a8b00;




    if (func_0209d1f0(request)) {
        (*(void (**)(char *))request)(request);
    }
    {
    Core *const core = &data_021a84c0;
    void (*callback)(void *);
    void *argument;
    int saved;
    func_0209d4ec(func_0209cd3c());
    *core->head = 0;
    callback = core->callback;
    argument = core->argument;
    saved = OS_DisableIrq();
    core->flags &= ~0x4c;
    func_02091a0c(&core->queue);
    if (core->flags & 0x10) func_020919d8(&core->thread);
    OS_RestoreIrq(saved);
    if (callback) callback(argument);
    }
}





