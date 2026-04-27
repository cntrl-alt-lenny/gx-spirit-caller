/* func_02053018: minimal pass-through thunk to func_02053000. */

extern void func_02053000(void *p);

void func_02053018(void *p) {
    func_02053000(p);
}
