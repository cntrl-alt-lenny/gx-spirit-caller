/* func_020a0504: minimal pass-through thunk to func_020a0234. */

extern void func_020a0234(void *p);

void func_020a0504(void *p) {
    func_020a0234(p);
}
