/* func_02053164: minimal pass-through thunk to func_02053170. */

extern void func_02053170(void *p);

void func_02053164(void *p) {
    func_02053170(p);
}
