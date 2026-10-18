extern int func_0202e234(int x);
extern int func_ov002_021baca8(int a, int b, int c);
extern void func_ov002_021e2d94(int a, int b, int c, int d);

void func_ov002_02253b6c(int arg)
{
    int i, j, lo, hi;

    if (func_0202e234(arg) != 0) {
        lo = 0;
        hi = 4;
    } else {
        lo = 5;
        hi = 9;
    }
    for (i = 0; i < 2; i++) {
        for (j = lo; j <= hi; j++) {
            if (func_ov002_021baca8(i, j, arg) != 0) {
                func_ov002_021e2d94(i, j, 5, 1);
            }
        }
    }
}
