/* func_0209bab0: one-shot init guard on data_021a8358.f_0. If already
 * initialized, return 1. Otherwise mark it, populate the remaining
 * fields from a0..a2, run func_0209bcb4, and translate its result to
 * 3 (failure) or 0 (success).
 */

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
extern int func_0209bcb4(void);

int func_0209bab0(int a0, int a1, int a2) {
    int saved = OS_DisableIrq();
    if (data_021a8358.f_0 != 0) {
        OS_RestoreIrq(saved);
        return 1;
    }
    data_021a8358.f_0 = 1;
    OS_RestoreIrq(saved);
    data_021a8358.f_14 = 1;
    data_021a8358.f_18 = 0;
    data_021a8358.f_8 = a0;
    data_021a8358.f_4 = a1;
    data_021a8358.f_10 = a2;
    int result = func_0209bcb4();
    return (result != 0) ? 0 : 3;
}
