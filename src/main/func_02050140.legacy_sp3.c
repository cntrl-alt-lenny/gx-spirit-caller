extern int func_0204e868(char *out, char *path, int count);
extern int func_020acca0(char *s, int end, int base);
extern void func_0204d97c(int id, int a1, int a2, int a3, int *vals, int n);

void func_02050140(int unused, int a1, char *path) {
    char buf[16];
    int vals[128];
    int i;

    for (i = 0; i < 128; i++) {
        if (func_0204e868(buf, path + 1, i) == -1) {
            break;
        }
        vals[i] = func_020acca0(buf, 0, 10);
    }
    func_0204d97c(*(unsigned char *)path, a1, 0, 0, vals, i);
}
