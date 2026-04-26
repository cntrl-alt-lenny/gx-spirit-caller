/* func_02053644: minimal pass-through thunk to func_02053688. */

extern void func_02053688(void *p);

void func_02053644(void *p) {
    func_02053688(p);
}
