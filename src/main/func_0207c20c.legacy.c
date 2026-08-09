/* func_0207c20c: IRQ-guarded guard chain. If data_021a088c is set and
 * its field at +0x2260 equals 1, clear data_021a088c and return 0;
 * otherwise return 1. Never assessed as a C-match target before this
 * round (brief 655 review found no duplicate-address evidence).
 */

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

extern void *data_021a088c;

int func_0207c20c(void) {
    int saved = OS_DisableIrq();
    void *p = data_021a088c;

    if (p == 0) {
        OS_RestoreIrq(saved);
        return 1;
    }

    if (*(int *)((char *)p + 0x2260) != 1) {
        OS_RestoreIrq(saved);
        return 1;
    }

    data_021a088c = 0;
    OS_RestoreIrq(saved);
    return 0;
}
