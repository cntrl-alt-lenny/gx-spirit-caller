/* func_02068c7c: call func_0206a9f4(p+0x4c), then func_02068084(p). */

extern void func_0206a9f4(void *p);
extern void func_02068084(void *p);

void func_02068c7c(void *p) {
    func_0206a9f4((char *)p + 0x4c);
    func_02068084(p);
}
