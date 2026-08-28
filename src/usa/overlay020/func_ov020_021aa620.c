extern char data_ov020_021adf80[];
extern void func_02098294(void *buf);
extern void func_ov020_021aa59c(void *buf, int n);
extern void func_02097f44(void *dst, void *src);
extern void func_02097db0(void *buf, int a, int b);
extern void func_0209281c(void *ptr, int flags);
extern void func_02038a84(void *buf, void *ptr, int n);
extern void func_02097efc(void *buf);

struct Pair021aa700 {
    int a;
    int b;
};

int func_ov020_021aa620(int idx, int sub, char *out) {
    char bufB[0x48];
    char bufA[0x40];
    struct Pair021aa700 *p;
    int a, b;

    {
        int *rowbase = *(int **)(data_ov020_021adf80 + 0xa94);
        int *row = rowbase + idx * 14;
        p = (struct Pair021aa700 *)(row + sub * 2);
    }
    a = p->a;
    b = p->b;

    if (out == 0) return b;

    if (b <= 0) {
        *out = 0;
    } else {
        func_02098294(bufB);
        func_ov020_021aa59c(bufA, sub + 1);
        func_02097f44(bufB, bufA);
        func_02097db0(bufB, a, 0);
        func_0209281c(out, 0x200);
        func_02038a84(bufB, out, b);
        func_02097efc(bufB);
    }

    return b;
}
