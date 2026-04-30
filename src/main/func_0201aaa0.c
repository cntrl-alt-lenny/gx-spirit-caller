/* func_0201aaa0: dispatch — `x >= 10 ? func_0201a9d0(x) : func_0201a778(x)`. */

extern int func_0201a9d0(int x);
extern int func_0201a778(int x);

int func_0201aaa0(int x) {
    if (x >= 10) return func_0201a9d0(x);
    return func_0201a778(x);
}
