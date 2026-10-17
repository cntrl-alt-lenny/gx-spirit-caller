extern int func_0202e234(int id);
extern int func_ov002_021baca8(int a, int b, int c);
extern void func_ov002_021d90fc(int a, int b, int c);

void func_ov002_02253928(int a, int b) {
    int i;
    int j;
    int lo;
    int hi;

    if (func_0202e234(a) != 0) {
        lo = 0;
        hi = 4;
    } else {
        lo = 5;
        hi = 9;
    }
    for (i = 0; i < 2; i++) {
        for (j = lo; j <= hi; j++) {
            if (func_ov002_021baca8(i, j, a) != 0) {
                func_ov002_021d90fc(i, j, b);
            }
        }
    }
}
