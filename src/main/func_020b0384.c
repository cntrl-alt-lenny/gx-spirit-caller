/* func_020b0384: minimal pass-through thunk to func_020aeeac. */

extern void func_020aeeac(void *p);

void func_020b0384(void *p) {
    func_020aeeac(p);
}
