/* func_02052ff4: minimal pass-through thunk to func_02052fb0. */

extern void func_02052fb0(void *p);

void func_02052ff4(void *p) {
    func_02052fb0(p);
}
