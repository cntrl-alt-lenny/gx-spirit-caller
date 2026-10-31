typedef struct {
    int *field_0;
    char pad_4[4];
    volatile int field_8;
    int field_c;
    char field_10[8];
    int field_18;
} Data;
extern Data data_021a84c0;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02091a8c(void *q);
extern void func_02093bfc(void);

void func_0209c280(int a0, int a1) {
    Data *const p = &data_021a84c0;
    int saved = OS_DisableIrq();
    int owner = p->field_8;
    if (owner == a0) {
        if (p->field_18 != a1) {
            func_02093bfc();
        }
    } else {
        if (p->field_8 != -3) { do {
            func_02091a8c(p->field_10);
        } while (p->field_8 != -3); }
        p->field_8 = a0;
        p->field_18 = a1;
    }
    p->field_c++;
    *p->field_0 = 0;
    OS_RestoreIrq(saved);
}






