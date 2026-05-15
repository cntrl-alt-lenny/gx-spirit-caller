/* func_0206850c: thunk — `func_020b1864(*a, *b)` (deref both args). */

extern int func_020b1864(int a, int b);

int func_0206850c(int *a, int *b) {
    return func_020b1864(*a, *b);
}
