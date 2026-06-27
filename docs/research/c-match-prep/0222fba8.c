/* CAMPAIGN-PREP candidate for func_0222fba8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     slot.id/b13 as :13/:1 bitfield (not mask); player bit0 bitfield; mla base via (f4&1)*0x868
 *   risk:       orig folds slot.id extract into the cmp/movs (lsl19;lsr19) and binds cf16c base in one reg across the mla; mwcc may emit `and 0x1fff` + reload globals -> reg-alloc, permuter-class
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct ce288 { char _a[0x5a8]; int f5a8; };
struct cd3f4 { char _a[4]; int f4; char _b[0x18]; int f20; };
struct slot20 { u32 id : 13; u32 b13 : 1; };
struct self_t { u16 f0; u16 player : 1; };
extern struct ce288 data_ov002_022ce288;
extern struct cd3f4 data_ov002_022cd3f4;
extern char data_ov002_022cf16c[];
extern int  data_ov002_022d016c[];
extern int  data_ov002_022cd744[];
extern int  func_ov002_021ae484(int x);
extern int  func_ov002_021de4b0(int self, int player, int idx);
extern int  func_ov002_021de528(int self, int player, int idx);
int func_ov002_0222fba8(struct self_t *self) {
    int state = data_ov002_022ce288.f5a8;
    int player;
    struct slot20 *slot;
    if (state == 0x7f) {
        if (*(int *)((char *)data_ov002_022d016c + 0xd44) != 0)
            func_ov002_021de528((int)self, data_ov002_022cd3f4.f4, data_ov002_022cd3f4.f20);
        else
            func_ov002_021de4b0((int)self, data_ov002_022cd3f4.f4, data_ov002_022cd3f4.f20);
        return 0;
    }
    if (state != 0x80) return 0;
    slot = (struct slot20 *)(data_ov002_022cf16c
            + (data_ov002_022cd3f4.f4 & 1) * 0x868
            + data_ov002_022cd3f4.f20 * 20 + 48);
    if (slot->id == 0) return 0;
    if (data_ov002_022cd3f4.f4 == (int)slot->b13) {
        player = self->player;
        if (data_ov002_022cd744[player] == 1)
            *(int *)((char *)data_ov002_022d016c + 0xd44) = 1;
        else
            func_ov002_021ae484(0x137);
    } else {
        *(int *)((char *)data_ov002_022d016c + 0xd44) = 0;
    }
    return 0x7f;
}
