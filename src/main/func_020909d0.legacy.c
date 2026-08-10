/* func_020909d0: save an IRQ-like state (via func_020937d0(a0) if a3, else
 * OS_DisableIrq), atomically swap a0 into *a1, and if the OLD value was 0
 * run a callback (a2, if set) and stamp *a1's halfword field. Finally
 * restore the saved state (func_020937e4 if a3, else OS_RestoreIrq) and
 * return the swap result. */

extern int func_020937d0(void *a0);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_020937e4(int mask);
extern unsigned int MI_SwapWord(unsigned int setData, volatile unsigned int *destp);

typedef void (*Callback_020909d0)(void);

int func_020909d0(unsigned int a0, void *a1, Callback_020909d0 a2, int a3) {
    int saved;
    unsigned int result;

    if (a3 != 0) {
        saved = func_020937d0((void *)a0);
    } else {
        saved = OS_DisableIrq();
    }

    result = MI_SwapWord(a0, (volatile unsigned int *)a1);
    if (result == 0) {
        if (a2 != 0) {
            a2();
        }
        *(short *)((char *)a1 + 4) = (short)a0;
    }

    if (a3 != 0) {
        func_020937e4(saved);
    } else {
        OS_RestoreIrq(saved);
    }
    return result;
}
