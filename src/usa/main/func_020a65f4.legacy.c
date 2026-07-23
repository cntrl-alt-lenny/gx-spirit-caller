extern void func_020a6694(int a, int *out, int b, int c);

int func_020a65f4(int a, int b, int c) {
    int out = -1;
    func_020a6694(a, &out, b, c);
    return ~out;
}
