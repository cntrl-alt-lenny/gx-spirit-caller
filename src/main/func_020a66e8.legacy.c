extern void func_020a6788(int a, int *out, int b, int c);

int func_020a66e8(int a, int b, int c) {
    int out = -1;
    func_020a6788(a, &out, b, c);
    return ~out;
}
