extern void *data_0219e30c;
extern void func_02094500(void *, int, int);

void func_02052600(void *a0) {
    data_0219e30c = a0;
    func_02094500(a0, 0, 0x614);
    *(short *)((char *)data_0219e30c + 0x600 + 0x10) = 0x5b9;
}
