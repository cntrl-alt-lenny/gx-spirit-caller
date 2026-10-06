extern char data_020fe550[];
extern void func_0203f590(void *in, unsigned char *out);
extern int func_020a7440(void *a, void *b, int n);
extern void func_02094688(void *src, void *dst, int n);

void func_0203f6cc(void *in, void *out) {
    unsigned char buf[0x18];

    func_0203f590(in, buf);
    if (func_020a7440(buf, data_020fe550, 8) != 0) {
        return;
    }
    func_02094688(buf + 8, out, 10);
}
