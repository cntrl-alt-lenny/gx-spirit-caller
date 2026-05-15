/* func_020874e0: thunk — `func_020872e4(1 << *p)`. */

extern int func_020872e4(unsigned int v);

int func_020874e0(unsigned int *p) {
    return func_020872e4(1u << *p);
}
