/* func_02068c08: thunk — `func_020b1864(*a, *b)` (deref both args). */

extern int func_020b1864(int a, int b);

int func_02068c08(int *a, int *b) {
    return func_020b1864(*a, *b);
}
