/* func_0201aa60: dispatch — `x >= 10 ? func_0201a990(x) : func_0201a738(x)`. */

extern int func_0201a990(int x);
extern int func_0201a738(int x);

int func_0201aa60(int x) {
    if (x >= 10) return func_0201a990(x);
    return func_0201a738(x);
}
