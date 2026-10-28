typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
    u32 a:1;
    u32 pad:7;
    u32 b:15;
    u32 rest:9;
    u8 pad4[4];
    u8 b8;
    u8 pad9[0xd];
    u16 h16;
} Data022cd300;
extern Data022cd300 data_ov002_022cd300;
extern int func_ov002_0226d814(int id);
extern int func_ov002_022707b8(int player, int a, int b);
extern int func_ov002_021bc288(int player, int slot);
extern int func_ov002_021bc618(int arg0);
int func_ov002_0226d864(int a, int b) {
    int i;
    int j;
    int flag = 0;
    int count = func_ov002_0226d814(b);
    int k = 0;
    Data022cd300 *d = &data_ov002_022cd300;
    d->a = a;
    d->b = b;
    d->h16 |= 2;
    d->b8 = 0;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (func_ov002_022707b8(i, j, k) != 0) {
                if (i == a && j <= 4) {
                    if (func_ov002_021bc288(i, j) != 0) flag = 1;
                }
                count--;
            }
        }
    }
    if (count > 0) return 0;
    if (flag == 0) {
        if (func_ov002_021bc618(a) == 0) return 0;
    }
    return 1;
}
