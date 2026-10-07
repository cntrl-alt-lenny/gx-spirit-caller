extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091a8c(void *queue);

typedef struct {
    char pad[0x14];
    int queue[2];
    volatile unsigned int flags;
} Dev;

int func_020972d4(Dev *dev) {
    int irq = OS_DisableIrq();
    int locked = (dev->flags & 8) ? 1 : 0;
    int acquired = (locked == 0) ? 1 : 0;
    if (acquired) {
        if (dev->flags & 0x10) {
            dev->flags |= 0x40;
            do {
                func_02091a8c(dev->queue);
            } while (dev->flags & 0x40);
        } else {
            dev->flags |= 8;
        }
    }
    OS_RestoreIrq(irq);
    return acquired;
}
