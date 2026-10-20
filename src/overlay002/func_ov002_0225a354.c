extern int func_ov002_021be2d8(int, int, int);
extern int func_ov002_021b3ecc(int, int, int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021baca8(int, int, int);
extern int func_ov002_021b4054(int, int, int, int);
extern int func_ov002_021b314c(int, int, int);
extern int func_ov002_021b359c(int, int);
extern int func_ov002_021c1d28(int, int, int);
extern char data_ov002_022cf1a8[];

int func_ov002_0225a354(int a, int b) {
    int other;
    if (func_ov002_021be2d8(a, b, 0) == 0) return 1;
    if (func_ov002_021b3ecc(a, 0xb, 0x15ff) != 0) return 0;
    if (func_ov002_021b3ecc(a, 0xb, 0x14a6) != 0) return 0;
    if (func_ov002_021b3ecc(a, 0xb, 0x1669) != 0) return 0;
    if (func_ov002_021bb068(0x1443) != 0) return 0;
    if (func_ov002_021baca8(a, b, 0x16bf) != 0) return 0;
    if (func_ov002_021baca8(a, b, 0x1a79) != 0) {
        if (*(int *)(data_ov002_022cf1a8 + (a & 1) * 0x868 + b * 0x14) != 0) return 0;
    }
    if (func_ov002_021b4054(a, b, 0x16cb, 4) != 0) return 0;
    other = 1 - a;
    if (func_ov002_021b3ecc(other, 0xb, 0x177a) != 0) return 0;
    if (func_ov002_021b314c(a, b, 0x1561) != 0) return 0;
    if (func_ov002_021b314c(a, b, 0x1852) != 0) return 0;
    if (func_ov002_021b359c(other, 0x1318) != 0) {
        if (func_ov002_021c1d28(a, b, 1) == 0) return 0;
    }
    return 1;
}
