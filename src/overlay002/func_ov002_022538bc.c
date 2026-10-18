extern int func_0202e234(int a);
extern int func_ov002_021baca8(int a, int b, int c);
extern void func_ov002_021d90fc(int a, int b, int c);
void func_ov002_022538bc(int a, int b, int c) {
    int i, end;
    if (func_0202e234(b) != 0) {
        i = 0;
        end = 4;
    } else {
        i = 5;
        end = 9;
    }
    for (; i <= end; i++) {
        if (func_ov002_021baca8(a, i, b) != 0)
            func_ov002_021d90fc(a, i, c);
    }
}
