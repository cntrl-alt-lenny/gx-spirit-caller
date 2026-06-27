/* CAMPAIGN-PREP candidate for func_02230064 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     coord-decode + cf1a4 check (as ff24); 021c92ec declared 1-arg (orig leaves r1-r3 leftovers, no movs); 0226b0f0 r2=1; (u16) of d016c.ce8 onto stack
 *   risk:       021c92ec is called with only r0 set (orig has NO arg movs before the bl); a multi-arg prototype would emit extra mov r1/r2/r3 -> use the 1-arg decl. Plus the player byte-offset CSE across cf16c+cf1a4 (same as ff24). reg-alloc/scheduling, permuter-class
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct ce288 { char _a[0x5a8]; int f5a8; };
struct d0e6c { char _a[0xb2]; u16 fb2; };
struct d016c { char _a[0xce8]; int fce8; };
struct self_t { u16 f0; u16 player : 1; u16 idx : 5; u16 f4; };
extern struct ce288 data_ov002_022ce288;
extern struct d0e6c data_ov002_022d0e6c;
extern struct d016c data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c92ec(int player);
extern int  func_ov002_021d59cc(int player, int idx, int f0, int c, u16 e);
extern int  func_ov002_021d90c0(int player, int idx, int b2);
extern void func_ov002_0226b0f0(int player, int f0, int c, int d);
int func_ov002_02230064(struct self_t *self) {
    int state = data_ov002_022ce288.f5a8;
    int player, idx, ret;
    char *base;
    u32 row;
    if (state == 0x7f) {
        func_ov002_021d90c0(self->player, self->idx, data_ov002_022d0e6c.fb2);
        func_ov002_021d59cc(self->player, self->idx, self->f0, 3,
                            (u16)data_ov002_022d016c.fce8);
        return 0;
    }
    if (state != 0x80) return 0;
    player = self->player;
    idx = self->idx;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    row = *(u32 *)(base + idx * 20 + 48);
    {
        int lhs = (u32)((u16)self->f4 << 17) >> 23;
        int rhs = (int)(((u32)(row << 2) >> 24) << 1) + (int)((u32)(row << 18) >> 31);
        if (lhs != rhs) return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    ret = func_ov002_021c92ec(player);
    func_ov002_0226b0f0(player, self->f0, 1, ((1 << ret) ^ 0xff));
    return 0x7f;
}
