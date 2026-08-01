extern char data_ov020_021ae060[];
extern void func_02098388(void *buf);
extern void func_ov020_021aa67c(void *buf, int n);
extern void func_02098038(void *dst, void *src);
extern void func_02097ea4(void *buf, int a, int b);
extern void func_02092904(void *ptr, int flags);
extern void func_02038ad4(void *buf, void *ptr, int n);
extern void func_02097ff0(void *buf);

struct Pair021aa700 {
    int a;
    int b;
};

int func_ov020_021aa700(int idx, int sub, char *out) {
    char bufB[0x48];
    char bufA[0x40];
    struct Pair021aa700 *p;
    int a, b;

    {
        int *rowbase = *(int **)(data_ov020_021ae060 + 0xa94);
        int *row = rowbase + idx * 14;
        p = (struct Pair021aa700 *)(row + sub * 2);
    }
    a = p->a;
    b = p->b;

    if (out == 0) return b;

    if (b <= 0) {
        *out = 0;
    } else {
        func_02098388(bufB);
        func_ov020_021aa67c(bufA, sub + 1);
        func_02098038(bufB, bufA);
        func_02097ea4(bufB, a, 0);
        func_02092904(out, 0x200);
        func_02038ad4(bufB, out, b);
        func_02097ff0(bufB);
    }

    return b;
}
