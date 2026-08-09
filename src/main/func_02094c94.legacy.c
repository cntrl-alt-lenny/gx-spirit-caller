extern void *func_02095880(int a);
extern void func_02095838(void *p);

void func_02094c94(void *a, void *b, void *c, void *d, void *e) {
    void *p = func_02095880(1);
    if (p == 0) {
        return;
    }
    *(void **)((char *)p + 0x4) = a;
    *(void **)((char *)p + 0x8) = b;
    *(void **)((char *)p + 0xc) = c;
    *(void **)((char *)p + 0x10) = d;
    *(void **)((char *)p + 0x14) = e;
    func_02095838(p);
}
