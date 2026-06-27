/* CAMPAIGN-PREP candidate for func_0223fc08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if/else-if state ladder (matches cmp#0/cmp#1/b chain); bit0 bitfield-shift; reload globals
 *   risk:       021ae514's r1/r3 args (the 0x196 / 0 set implicitly) are inferred from register state at the call; if wrong the bl setup diverges. The eor 0226b0d0 path arg order is reshape-able; 021ae514 arg guess is the real risk. struct-guessed.
 *   confidence: low
 */
/* func_ov002_0223fc08: 3-state step machine keyed on ce288[0x5b8].
 * state0: gate on cd744[f2&1]; either zero d016c[0xd44] or fire 021ae514, then
 * state++. state1: 0223dad0 / 0226b0d0 with bit0 toggled, then state++.
 * else: return 1. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Ent0223fc08 { u16 f0; u16 f2; };

extern char data_ov002_022cd744[];   /* int flag table */
extern char data_ov002_022ce288[];   /* +0x5b8 state */
extern char data_ov002_022d016c[];   /* +0xd44 scalar */
extern void func_ov002_021ae514(int a, int b, int c, int d, int e, int f);
extern void func_ov002_0223dad0(struct Ent0223fc08 *self, int v);
extern void func_ov002_0226b0d0(int a, u16 b, int c, int d);

int func_ov002_0223fc08(struct Ent0223fc08 *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5b8);
    if (state == 0) {
        int bit0 = (unsigned)((u16)self->f2 << 31) >> 31;
        if (*(int *)(data_ov002_022cd744 + (bit0 << 2)) == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = 0;
        } else {
            func_ov002_021ae514(0x67, 0x196, 0x196 + 1, 0, 0, 0xf);
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) = *(int *)(data_ov002_022ce288 + 0x5b8) + 1;
        return 0;
    }
    if (state == 1) {
        int s = *(int *)(data_ov002_022d016c + 0xd44);
        int bit0 = (unsigned)((u16)self->f2 << 31) >> 31;
        func_ov002_0223dad0(self, (u16)(s ^ bit0));
        func_ov002_0226b0d0(1 - bit0, self->f0, *(int *)(data_ov002_022d016c + 0xd44), 0);
        *(int *)(data_ov002_022ce288 + 0x5b8) = *(int *)(data_ov002_022ce288 + 0x5b8) + 1;
        return 0;
    }
    return 1;
}
