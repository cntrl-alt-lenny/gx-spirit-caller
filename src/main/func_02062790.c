/* func_02062790: minimal pass-through thunk to func_02062320. */

extern void func_02062320(void *p);

void func_02062790(void *p, int unused1) {
    func_02062320(p);
}
