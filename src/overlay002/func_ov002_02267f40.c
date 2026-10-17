extern char data_ov002_022d016c[];
extern int func_ov002_021bc8c8(int a, int b, int c);

int func_ov002_02267f40(int a, int b, int c) {
    int n = b + c;
    if (n <= 4 && a == *(int *)(data_ov002_022d016c + 0xcec)) {
        if (func_ov002_021bc8c8(a, a, n) != 0 && *(int *)(data_ov002_022d016c + 0xd28) != n) {
            return 0x800;
        }
    }
    return 0;
}
