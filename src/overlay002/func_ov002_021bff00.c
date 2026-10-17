extern int func_ov002_021bf294(int a, int b, int c, int d, int e);

int func_ov002_021bff00(int a, int b) {
    int i;
    int count = 0;
    for (i = 0; i <= 4; i++) {
        if (func_ov002_021bf294(a, b, 1 - a, i, 1) != 0) {
            count++;
        }
    }
    return count;
}
