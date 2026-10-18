typedef unsigned int u32;
typedef unsigned char u8;

struct S_cd300 {
    u32 player_bit : 1;
    u32 rest : 31;
    char _pad[4];
    u8 f_8;
};
extern struct S_cd300 data_ov002_022cd300;

struct S_ce288 {
    char _pad[0x6a4];
    int count;
    char _pad2[0x6b4 - 0x6a8];
    int list[1];
};
extern struct S_ce288 data_ov002_022ce288;

extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bd710(int a, int b);
extern int func_ov002_021bc618(int a);
extern int func_ov002_021bc288(int a, int b);

int func_ov002_02274ae0(int a, int b, int c) {
    int r4;
    int i;
    int n = b + c;
    if (n > 10) return 0;
    if (a != data_ov002_022cd300.player_bit) return 0;
    r4 = func_ov002_021b9ecc(a, n);
    if (r4 == 0) return 0;
    if (func_ov002_021bd710(a, n) != 0) return 0;
    if (data_ov002_022cd300.f_8 == 0) {
        if (func_ov002_021bc618(data_ov002_022cd300.player_bit) == 0) {
            if (func_ov002_021bc288(a, n) == 0) return 0;
        }
    }
    for (i = 0; i < data_ov002_022ce288.count; i++) {
        if (r4 == data_ov002_022ce288.list[i]) return 0x800;
    }
    return 0;
}
