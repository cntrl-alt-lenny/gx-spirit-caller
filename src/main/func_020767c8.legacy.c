extern void func_020785cc(void *p);
extern int  func_020aaddc(const char *s);
extern void func_0207850c(void *p, const void *src, int len);
extern void func_02078498(void *p, void *out);
extern void func_02077f8c(void *p);
extern void func_02077ecc(void *p, const void *src, int len);
extern void func_02077e58(void *p, void *a0);

void func_020767c8(void *a0, char *a1, char *a2) {
    char local[0x14];
    void *p;

    p = a2 + 0x348;
    func_020785cc(p);
    func_0207850c(p, a1, func_020aaddc(a1));
    func_0207850c(p, a2, 0x30);
    func_0207850c(p, a2 + 0x34, 0x40);
    func_02078498(p, local);

    p = a2 + 0x3fc;
    func_02077f8c(p);
    func_02077ecc(p, a2, 0x30);
    func_02077ecc(p, local, 0x14);
    func_02077e58(p, a0);
}
