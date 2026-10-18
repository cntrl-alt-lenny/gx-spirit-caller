extern int func_0202e234(int a);
extern int func_ov002_021baca8(int a, int b, int c);
extern void func_ov002_021e2d94(int a, int b, int c, int d);

void func_ov002_02253af8(int a, int b)
{
    int i;
    int end;

    if (func_0202e234(b) != 0) {
        i = 0;
        end = 4;
    } else {
        i = 5;
        end = 9;
    }
    for (; i <= end; i++) {
        if (func_ov002_021baca8(a, i, b) != 0) {
            func_ov002_021e2d94(a, i, 5, 1);
        }
    }
}
