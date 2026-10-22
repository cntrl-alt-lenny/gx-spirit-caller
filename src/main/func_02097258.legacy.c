extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_02097af0(void *self);
extern void func_02097a4c(int task);

typedef struct {
    char pad[0x1c];
    unsigned int flags;
} Device;

int func_02097258(Device *self) {
    int task = 0;
    int irq = OS_DisableIrq();
    int locked = (self->flags & 8) ? 1 : 0;
    int unlocked = (locked == 0) ? 1 : 0;
    if (!unlocked) {
        self->flags &= ~8;
        task = func_02097af0(self);
    }
    OS_RestoreIrq(irq);
    if (task != 0) {
        func_02097a4c(task);
    }
    return unlocked;
}
