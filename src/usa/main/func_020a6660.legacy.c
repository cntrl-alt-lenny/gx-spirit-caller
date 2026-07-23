extern void func_020a67ac(int a, unsigned char *out, int b, int c);

int func_020a6660(int a, int b, int c) {
    unsigned char out = 0;
    func_020a67ac(a, &out, b, c);
    return out;
}
