extern char *data_021a981c;
extern int func_020a08a8(int a, int b, int c);
extern int func_020a1ac8(int a, int b, int c);

int func_020a1b04(int a, int b, int c) {
    if (func_020a08a8(a, b, c)) {
        char *row = data_021a981c + (a - 1) * 4;
        row = row + 0x1000;
        *(int *)(row + 0x4e8) = b;
    }
    return func_020a1ac8(a, b, c);
}
