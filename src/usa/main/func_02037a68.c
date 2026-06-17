/* func_02037a68: minimal pass-through thunk to func_02037a20. */

extern void func_02037a20(void *p);

void func_02037a68(void *p) {
    func_02037a20(p);
}
