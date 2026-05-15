/* func_020b1864: minimal pass-through thunk to func_020b17fc. */

extern void func_020b17fc(void *p);

void func_020b1864(void *p) {
    func_020b17fc(p);
}
