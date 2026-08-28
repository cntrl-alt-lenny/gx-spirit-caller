extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void WaitByLoop(int count);
extern int func_02090808(int addr);
extern int func_020908a8(void *a);

typedef struct {
    int field_0;
    int field_4;
} A1_t;

void func_020a5d9c(void *a0, A1_t *a1) {
    for (;;) {
        a1->field_4 = OS_DisableIrq();
        a1->field_0 = func_02090808(0x027fffe8) & 0x40;
        if (a1->field_0 != 0) {
            return;
        }
        if (func_020908a8(a0) == 0) {
            return;
        }
        OS_RestoreIrq(a1->field_4);
        WaitByLoop(1);
    }
}
