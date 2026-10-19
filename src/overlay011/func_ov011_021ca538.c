#include <nitro/fx_mtx.h>
extern void func_0201e818(int a0, int a1, int a2, int *out);
extern void G2x_SetBGyAffine_(u32 ptr, const struct Mtx22 *mtx, fx32 a, fx32 b, fx32 c, fx32 d);
struct Table { unsigned char pair[5][2]; };
extern struct Table data_ov011_021d2fbe;
struct View { char pad[0x238]; int x, y; char pad2[0x7c]; unsigned int flags : 8; unsigned int rest : 24; };
extern struct View data_ov011_021d4000;
void func_ov011_021ca538(int value) {
    struct Table buf = data_ov011_021d2fbe;
    struct Mtx22 matrix;
    int scale, idx;
    scale = 0x1000 + 10 * (value + (int)(((long long)value * value + 0x800) >> 12));
    idx = (int)data_ov011_021d4000.flags - 1;
    func_0201e818(scale, scale, 0, matrix._);
    G2x_SetBGyAffine_(0x04000030, &matrix, buf.pair[idx][0], buf.pair[idx][1], data_ov011_021d4000.x >> 12, data_ov011_021d4000.y >> 12);
}


