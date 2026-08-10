extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void OSi_EnqueueTail(void *queue, void *item);
extern void func_02091a8c(void *x);
extern char data_021a63d0[];

void func_020927b8(char *self) {
    int state;
    void *owner;

    state = OS_DisableIrq();
    owner = *(void **)(data_021a63d0 + 4);

    for (;;) {
        if (*(void **)(self + 8) == 0) {
            *(void **)(self + 8) = owner;
            *(int *)(self + 0xc) = *(int *)(self + 0xc) + 1;
            OSi_EnqueueTail(owner, self);
            break;
        }
        if (*(void **)(self + 8) == owner) {
            *(int *)(self + 0xc) = *(int *)(self + 0xc) + 1;
            break;
        }
        *(void **)((char *)owner + 0x84) = self;
        func_02091a8c(self);
        *(void **)((char *)owner + 0x84) = 0;
    }

    OS_RestoreIrq(state);
}
