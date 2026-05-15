/* func_0201cfa4: `(func_02020408(arg) & 2) ? 1 : 0`. */

extern int func_02020408(int arg);

int func_0201cfa4(int arg) {
    int r = 0;
    if (func_02020408(arg) & 2) r += 1;
    return r;
}
