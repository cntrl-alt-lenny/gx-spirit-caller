typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 _r : 15; };
struct Cd3f4 { int _0; int f4; char _8[0x18]; int f20; };
extern struct Cd3f4 data_ov002_022cd314;
extern int func_ov002_021c1e10(struct Ov002Self *self, int player, int idx);

int func_ov002_021edbf8(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    if (self->b0 != player)
        return 0;
    if (func_ov002_021c1e10(self, player, idx) == 0)
        return 0;
    if (data_ov002_022cd314.f4 == player && data_ov002_022cd314.f20 == idx)
        return 0;
    return 1;
}
