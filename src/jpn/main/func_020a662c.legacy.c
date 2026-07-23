extern void func_020a671c(int a, unsigned short *out, int b, int c);

int func_020a662c(int a, int b, int c) {
    unsigned short out = 0;
    func_020a671c(a, &out, b, c);
    return out;
}
