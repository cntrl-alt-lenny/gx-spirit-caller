extern void func_0207850c(void *dst, const void *src, int n);
extern void func_020945f4(void *dst, int val, int n);
extern void func_02078498(void *p, void *arg1);
extern void func_020785cc(void *p);

extern char data_02101f18[];
extern char data_02101f20[];

void func_0207634c(void *self, void *arg1, int a2) {
    char local[0x28];
    unsigned char b = *(unsigned char *)((char *)self + 0x454);
    char *p = (char *)self + 0x2ec;

    if ((b ^ a2) != 0) {
        func_0207850c(p, data_02101f18, 4);
    } else {
        func_0207850c(p, data_02101f20, 4);
    }
    func_0207850c(p, self, 0x30);
    func_020945f4(local, 0x36, 0x28);
    func_0207850c(p, local, 0x28);
    func_02078498(p, arg1);
    func_020785cc(p);
    func_0207850c(p, self, 0x30);
    func_020945f4(local, 0x5c, 0x28);
    func_0207850c(p, local, 0x28);
    func_0207850c(p, arg1, 0x14);
    func_02078498(p, arg1);
}
