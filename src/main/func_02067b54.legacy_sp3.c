extern int func_02068380(void *p, int param2);

void func_02067b54(void *self, int param2) {
    if (func_02068380((char *)self + 8, param2) != 0) {
        return;
    }
    func_02068380((char *)self + 0x14, param2);
}
