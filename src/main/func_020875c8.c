/* func_020875c8: thunk — `func_020873cc(1 << *p)`. */

extern int func_020873cc(unsigned int v);

int func_020875c8(unsigned int *p) {
    return func_020873cc(1u << *p);
}
