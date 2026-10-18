typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;

typedef struct {
    u32 a : 1;
    u32 pad : 7;
    u32 b : 15;
    u32 rest : 9;
    u8 pad4[4];
    u8 b8;
    u8 pad9[0xD];
    u16 h16;
} Data022cd300;

extern Data022cd300 data_ov002_022cd300;
extern int func_ov002_02270ba0(int a, int b, int c);

int func_ov002_0226d784(int a, int b) {
    int i;
    int j;
    int k = 0;
    Data022cd300 *d = &data_ov002_022cd300;

    d->a = a;
    d->b = b;
    d->h16 |= 2;
    d->b8 = 0;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (func_ov002_02270ba0(i, j, k) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
