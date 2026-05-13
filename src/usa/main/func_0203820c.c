/* func_0203820c: thunk — `func_0203816c(a, -1, b, d)` (drop arg 2). */

extern int func_0203816c(int a, int b, int c, int d);

int func_0203820c(int a, int b, int unused, int d) {
    return func_0203816c(a, -1, b, d);
}
