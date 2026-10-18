typedef struct {
    int x;
    int y;
} Vec;

extern int func_ov011_021d22d4(Vec a, Vec b);

int func_ov011_021d2390(short *a, short *b, Vec p) {
    Vec vb = { b[0] << 12, b[1] << 12 };
    Vec va = { a[0] << 12, a[1] << 12 };
    int d1 = func_ov011_021d22d4(va, p);
    int d2 = func_ov011_021d22d4(vb, p);
    int d3 = func_ov011_021d22d4(vb, va);
    return d3 - (d2 - d1);
}
