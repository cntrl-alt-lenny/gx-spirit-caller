/* func_02068580: thunk — `func_020b1958(*a, *b)` (deref both args). */

extern int func_020b1958(int a, int b);

int func_02068580(int *a, int *b) {
    return func_020b1958(*a, *b);
}
