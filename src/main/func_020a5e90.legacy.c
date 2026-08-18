extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void WaitByLoop(int count);
extern int func_020908f0(int addr);
extern int func_02090990(void *a);

typedef struct {
    int field_0;
    int field_4;
} A1_t;

void func_020a5e90(void *a0, A1_t *a1) {
    for (;;) {
        a1->field_4 = OS_DisableIrq();
        a1->field_0 = func_020908f0(0x027fffe8) & 0x40;
        if (a1->field_0 != 0) {
            return;
        }
        if (func_02090990(a0) == 0) {
            return;
        }
        OS_RestoreIrq(a1->field_4);
        WaitByLoop(1);
    }
}
