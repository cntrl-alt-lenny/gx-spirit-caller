extern void func_ov002_0229cd70(void *dst, void *src, int n);
extern void func_ov002_0229cd1c(void *buf, int len);
extern void func_ov002_021b1488(int a, int b);

void func_ov002_021b1570(int a, int b, void *c, int n) {
    unsigned short buf[128];
    int i = 0;
    buf[i++] = a;
    if (b != -1) {
        buf[i++] = b;
    }
    if (n > 0) {
        func_ov002_0229cd70(&buf[i], c, n);
        i += (unsigned)(n + 1) >> 1;
    }
    func_ov002_021b1488(a, 1);
    func_ov002_0229cd1c(buf, i * 2);
}
