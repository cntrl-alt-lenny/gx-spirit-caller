extern void func_02078424(void *dst, const void *src, int n);
extern void func_02094500(void *dst, int val, int n);
extern void func_020783b0(void *p, void *arg1);
extern void func_020784e4(void *p);

extern char data_02101e38[];
extern char data_02101e40[];

void func_02076264(void *self, void *arg1, int a2) {
    char local[0x28];
    unsigned char b = *(unsigned char *)((char *)self + 0x454);
    char *p = (char *)self + 0x2ec;

    if ((b ^ a2) != 0) {
        func_02078424(p, data_02101e38, 4);
    } else {
        func_02078424(p, data_02101e40, 4);
    }
    func_02078424(p, self, 0x30);
    func_02094500(local, 0x36, 0x28);
    func_02078424(p, local, 0x28);
    func_020783b0(p, arg1);
    func_020784e4(p);
    func_02078424(p, self, 0x30);
    func_02094500(local, 0x5c, 0x28);
    func_02078424(p, local, 0x28);
    func_02078424(p, arg1, 0x14);
    func_020783b0(p, arg1);
}
