/* CAMPAIGN-PREP candidate for func_021f6940 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1 vs int player; signed idx>4 guard; (player&1)*0x868 + idx*20+48 row; Slot.id :13 !=0
 *   risk:       index built as two mla (player*0x868, idx*0x14) then ldr[#0x30]; mwcc mla order/fold could shift. reshape-able; matched precedent 0228dda8 makes it low-risk.
 *   confidence: high
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self {
    u16 f0;
    u16 b0 : 1;
};

struct Slot {
    u32 id : 13;
};

extern char data_ov002_022cf16c[];

int func_ov002_021f6940(struct Self *self, int player, int idx) {
    char *base;
    struct Slot *slot;
    if (self->b0 != player) return 0;
    if (idx > 4) return 0;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    slot = (struct Slot *)(base + idx * 20 + 48);
    return slot->id != 0;
}
