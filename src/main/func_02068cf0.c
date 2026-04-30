/* func_02068cf0: call func_0206aa68(p+0x4c), then func_020680f8(p). */

extern void func_0206aa68(void *p);
extern void func_020680f8(void *p);

void func_02068cf0(void *p) {
    func_0206aa68((char *)p + 0x4c);
    func_020680f8(p);
}
