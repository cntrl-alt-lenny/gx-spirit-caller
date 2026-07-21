extern void func_020919d8(void *p);

void func_02091748(void **obj) {
    void *p = obj[0];
    obj[0] = 0;
    *(int *)((char *)p + 0xb0) = 0;
    func_020919d8(p);
}
