/* func_020530f0: minimal pass-through thunk to func_020530fc. */

extern void func_020530fc(void *p);

void func_020530f0(void *p) {
    func_020530fc(p);
}
