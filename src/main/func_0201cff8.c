/* func_0201cff8: `(func_0202045c(arg) & 2) ? 1 : 0`. */

extern int func_0202045c(int arg);

int func_0201cff8(int arg) {
    int r = 0;
    if (func_0202045c(arg) & 2) r += 1;
    return r;
}
