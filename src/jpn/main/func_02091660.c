extern void func_020918f0(void *p);

void func_02091660(void **obj) {
    void *p = obj[0];
    obj[0] = 0;
    *(int *)((char *)p + 0xb0) = 0;
    func_020918f0(p);
}
