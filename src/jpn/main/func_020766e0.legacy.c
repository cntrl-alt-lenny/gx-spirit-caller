extern void func_020784e4(void *p);
extern int  func_020aace8(const char *s);
extern void func_02078424(void *p, const void *src, int len);
extern void func_020783b0(void *p, void *out);
extern void func_02077ea4(void *p);
extern void func_02077de4(void *p, const void *src, int len);
extern void func_02077d70(void *p, void *a0);

void func_020766e0(void *a0, char *a1, char *a2) {
    char local[0x14];
    void *p;

    p = a2 + 0x348;
    func_020784e4(p);
    func_02078424(p, a1, func_020aace8(a1));
    func_02078424(p, a2, 0x30);
    func_02078424(p, a2 + 0x34, 0x40);
    func_020783b0(p, local);

    p = a2 + 0x3fc;
    func_02077ea4(p);
    func_02077de4(p, a2, 0x30);
    func_02077de4(p, local, 0x14);
    func_02077d70(p, a0);
}
