extern int func_ov002_021bcd80(int a, int b);
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_0226de80(int arg0)
{
    int who;
    int j;
    int i;

    if (func_ov002_021bcd80(arg0, -1) < 2) {
        return 0;
    }
    for (i = 0; i < 2; i++) {
        who = arg0 ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021bc8c8(arg0, who, j) != 0) {
                switch (func_ov002_021b9ecc(who, j)) {
                case 0x13e5:
                case 0x13e7:
                    return 1;
                }
            }
        }
    }
    return 0;
}
