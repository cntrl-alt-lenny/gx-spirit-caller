extern void *func_0209578c(int a);
extern void func_02095744(void *p);

void func_02094ba0(void *a, void *b, void *c, void *d, void *e) {
    void *p = func_0209578c(1);
    if (p == 0) {
        return;
    }
    *(void **)((char *)p + 0x4) = a;
    *(void **)((char *)p + 0x8) = b;
    *(void **)((char *)p + 0xc) = c;
    *(void **)((char *)p + 0x10) = d;
    *(void **)((char *)p + 0x14) = e;
    func_02095744(p);
}
