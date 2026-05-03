/* func_02068c7c: thunk — `func_020b1958(*a, *b)` (deref both args). */

extern int func_020b1958(int a, int b);

int func_02068c7c(int *a, int *b) {
    return func_020b1958(*a, *b);
}
