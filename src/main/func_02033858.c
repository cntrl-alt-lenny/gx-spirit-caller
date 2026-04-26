/* func_02033858: minimal pass-through thunk to func_02046a1c. */

extern void func_02046a1c(void *p);

void func_02033858(void *p) {
    func_02046a1c(p);
}
