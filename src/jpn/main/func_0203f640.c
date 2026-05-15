/* func_0203f640: thunk — `func_0203f32c(p + 0xc)`. */

extern void func_0203f32c(void *p);

void func_0203f640(void *p) {
    func_0203f32c((char *)p + 0xc);
}
