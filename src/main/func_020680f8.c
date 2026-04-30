/* func_020680f8: call func_02068368 twice on (p+0x14) then (p+0x8). */

extern void func_02068368(void *p);

void func_020680f8(void *p) {
    func_02068368((char *)p + 0x14);
    func_02068368((char *)p + 0x8);
}
