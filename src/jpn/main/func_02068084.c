/* func_02068084: call func_020682f4 twice on (p+0x14) then (p+0x8). */

extern void func_020682f4(void *p);

void func_02068084(void *p) {
    func_020682f4((char *)p + 0x14);
    func_020682f4((char *)p + 0x8);
}
