/* func_0209bb70: sibling of func_0209bba4 (same data_021a8358 struct
 * shape: one-shot init guard on f_0; if already set, return 1;
 * otherwise mark it, populate remaining fields from the args, run
 * a helper, translate its result to 0/3). See
 * func_0209bba4.legacy.c and func_0209bc20.legacy.c (which calls
 * this function with a real callback arg) for the sibling shapes
 * this is drawn from. */

typedef struct {
    int f_0;
    int f_4;
    int f_8;
    char _pad_c[4];
    int f_10;
    int f_14;
    int f_18;
} data_t;

extern data_t data_021a8358;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int func_0209bcc4(void);

int func_0209bb70(void *a0, void (*callback)(void), int a2) {
    int saved = OS_DisableIrq();
    if (data_021a8358.f_0 != 0) {
        OS_RestoreIrq(saved);
        return 1;
    }
    data_021a8358.f_0 = 1;
    OS_RestoreIrq(saved);
    data_021a8358.f_14 = 0;
    data_021a8358.f_18 = 0;
    data_021a8358.f_8 = (int)a0;
    data_021a8358.f_4 = (int)callback;
    data_021a8358.f_10 = a2;
    return (func_0209bcc4() != 0) ? 0 : 3;
}
