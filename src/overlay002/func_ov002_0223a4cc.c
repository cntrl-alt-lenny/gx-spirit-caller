extern char data_ov002_022d016c[];
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021b9e00(int arg0, int arg1);
extern int func_ov002_021b9e48(int arg0, int arg1);
extern int func_ov002_021b9e90();
extern int func_ov002_021b9ea4();
extern int func_ov002_021b9eb8();
extern void func_ov002_021d91e0(int a, int b, int c);
extern void func_ov002_021d93e0(int a, int b, int c);
extern void func_ov002_021d94ac(int a, int b, int c, int d);
int func_ov002_0223a4cc(int self) {
    int side, j, i, value;
    for (i = 0; i < 2; i++) {
        side = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        for (j = 0; j <= 10; j++) {
            if (func_ov002_0225764c(self, side, j)) {
                value = func_ov002_021b9e00(side, j);
                if (value) func_ov002_021d91e0(side, j, -value);
                value = func_ov002_021b9e48(side, j);
                if (value) func_ov002_021d93e0(side, j, -value);
                value = func_ov002_021b9e90(side, j);
                if (value) func_ov002_021d94ac(side, j, -value, 0x1513);
                value = func_ov002_021b9ea4(side, j);
                if (value) func_ov002_021d94ac(side, j, -value, 0x1a90);
                value = func_ov002_021b9eb8(side, j);
                if (value) func_ov002_021d94ac(side, j, -value, 0x1439);
            }
        }
    }
    return 0;
}


