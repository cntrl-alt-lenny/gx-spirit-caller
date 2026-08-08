extern char *data_021a98fc;
extern int func_020a099c(int a, int b, int c);
extern int func_020a1bbc(int a, int b, int c);

int func_020a1bf8(int a, int b, int c) {
    if (func_020a099c(a, b, c)) {
        char *row = data_021a98fc + (a - 1) * 4;
        row = row + 0x1000;
        *(int *)(row + 0x4e8) = b;
    }
    return func_020a1bbc(a, b, c);
}
