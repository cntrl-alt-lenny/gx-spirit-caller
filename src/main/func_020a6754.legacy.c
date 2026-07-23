extern void func_020a68a0(int a, unsigned char *out, int b, int c);

int func_020a6754(int a, int b, int c) {
    unsigned char out = 0;
    func_020a68a0(a, &out, b, c);
    return out;
}
