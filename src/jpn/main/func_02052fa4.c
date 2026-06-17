/* func_02052fa4: minimal pass-through thunk to func_02052f8c. */

extern void func_02052f8c(void *p);

void func_02052fa4(void *p) {
    func_02052f8c(p);
}
