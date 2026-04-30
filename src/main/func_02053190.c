/* func_02053190: thunk — `func_020531a0(p + 0x10)`. */

extern void func_020531a0(void *p);

void func_02053190(void *p) {
    func_020531a0((char *)p + 0x10);
}
