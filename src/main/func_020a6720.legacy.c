extern void func_020a6810(int a, unsigned short *out, int b, int c);

int func_020a6720(int a, int b, int c) {
    unsigned short out = 0;
    func_020a6810(a, &out, b, c);
    return out;
}
