/* func_02090a60: validate a1->f_4 against a0, then disable-irq (variant
 * selected by a3), clear the handle, fire an optional callback, and
 * restore-irq (matching variant).
 */

typedef struct {
    int f_0;
    unsigned short f_4;
} handle_t;

extern int func_020937d0(void);
extern void func_020937e4(int saved);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

int func_02090a60(int a0, handle_t *a1, void (*a2)(void), int a3) {
    if (a0 != a1->f_4) {
        return -2;
    }
    int saved;
    if (a3 != 0) {
        saved = func_020937d0();
    } else {
        saved = OS_DisableIrq();
    }
    a1->f_4 = 0;
    if (a2 != 0) {
        a2();
    }
    a1->f_0 = 0;
    if (a3 != 0) {
        func_020937e4(saved);
    } else {
        OS_RestoreIrq(saved);
    }
    return 0;
}
