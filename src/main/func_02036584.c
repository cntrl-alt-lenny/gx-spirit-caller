/* func_02036584: minimal pass-through thunk to func_02036298. */

extern void func_02036298(void *p);

void func_02036584(void *p) {
    func_02036298(p);
}
