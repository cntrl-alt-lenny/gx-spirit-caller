/* func_02060c90: minimal pass-through thunk to func_02055000. */

extern void func_02055000(void *p);

void func_02060c90(void *p) {
    func_02055000(p);
}
