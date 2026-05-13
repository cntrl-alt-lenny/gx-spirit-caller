/* func_02036534: minimal pass-through thunk to func_02036248. */

extern void func_02036248(void *p);

void func_02036534(void *p) {
    func_02036248(p);
}
