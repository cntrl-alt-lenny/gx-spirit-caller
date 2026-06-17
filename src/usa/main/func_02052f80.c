/* func_02052f80: minimal pass-through thunk to func_02052f3c. */

extern void func_02052f3c(void *p);

void func_02052f80(void *p) {
    func_02052f3c(p);
}
