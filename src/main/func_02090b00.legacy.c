typedef void (*Callback_020909d0)(void);
extern int func_020909d0(unsigned int, void *, Callback_020909d0, int);
extern void WaitByLoop(int);
int func_02090b00(int a, int b, int c, int d) {
    int result = func_020909d0(a, (void *)b, (Callback_020909d0)c, d);
    if (result <= 0) return result;
    do {
        WaitByLoop(0x400);
        result = func_020909d0(a, (void *)b, (Callback_020909d0)c, d);
    } while (result > 0);
    return result;
}
