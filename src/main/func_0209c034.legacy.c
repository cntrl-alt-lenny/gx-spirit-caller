extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091a8c(void *queue);

typedef struct {
    int *head;
    char pad[0x10c - 4];
    int queue[2];
    unsigned int flags;
} Core;

extern Core data_021a84c0;

int func_0209c034(void) {
    Core *const p = &data_021a84c0;
    int irq = OS_DisableIrq();
    if (p->flags & 4) {
        do {
            func_02091a8c(p->queue);
        } while (p->flags & 4);
    }
    OS_RestoreIrq(irq);
    if (*p->head == 0) {
        return 1;
    }
    return 0;
}
