/* func_0207c124: IRQ-guarded guard chain. If data_021a07ac is set and
 * its field at +0x2260 equals 1, clear data_021a07ac and return 0;
 * otherwise return 1. Never assessed as a C-match target before this
 * round (brief 655 review found no duplicate-address evidence).
 */

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

extern void *data_021a07ac;

int func_0207c124(void) {
    int saved = OS_DisableIrq();
    void *p = data_021a07ac;

    if (p == 0) {
        OS_RestoreIrq(saved);
        return 1;
    }

    if (*(int *)((char *)p + 0x2260) != 1) {
        OS_RestoreIrq(saved);
        return 1;
    }

    data_021a07ac = 0;
    OS_RestoreIrq(saved);
    return 0;
}
