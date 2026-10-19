/* func_020216b0: minimal pass-through thunk to func_02022260. */

extern void func_02022260(void *p);

void func_020216b0(void *p, int unused1, int unused2) {
    func_02022260(p);
}
