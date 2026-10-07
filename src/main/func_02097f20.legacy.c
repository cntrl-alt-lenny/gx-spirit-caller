extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091a8c(void *queue);
extern int func_02097a04(void *dev);

typedef struct {
    char pad[0xc];
    volatile unsigned int flags;
    char pad2[4];
    int f14;
    int queue[2];
} Dev;

int func_02097f20(Dev *dev) {
    int irq;
    int acquired = 0;
    irq = OS_DisableIrq();
    if ((dev->flags & 1) ? 1 : 0) {
        acquired = (dev->flags & 0x44) ? 0 : 1;
        if (acquired) {
            dev->flags |= 4;
            do {
                func_02091a8c(dev->queue);
            } while (!(dev->flags & 0x40));
        } else {
            do {
                func_02091a8c(dev->queue);
            } while ((dev->flags & 1) ? 1 : 0);
        }
    }
    OS_RestoreIrq(irq);
    if (acquired) {
        return func_02097a04(dev);
    }
    return dev->f14 == 0 ? 1 : 0;
}
