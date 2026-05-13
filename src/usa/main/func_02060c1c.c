/* func_02060c1c: minimal pass-through thunk to func_02054f8c. */

extern void func_02054f8c(void *p);

void func_02060c1c(void *p) {
    func_02054f8c(p);
}
