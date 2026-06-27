/* CAMPAIGN-PREP candidate for func_0222b954 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl lo before hi (unk14 byte decode); f0 reloaded for switch; mla base bind
 *   risk:       Switch case ordering: orig tests 0x1700,0x1703,0x1749 via add #0x46 chain not a jump table; if mwcc range-fuses or reorders cmp the 0x1703/0x1749 derivation diverges. reshape-able (case order = source order, explicit literals).
 *   confidence: med
 */
/* func_ov002_0222b954: decode self->unk14 into (lo,hi) bytes; if predicate
 * 021b3ecc(lo,hi,self->f0) holds, dispatch on self->f0 to one of three
 * handlers; the 0x1749 case is gated by a (lo&1)*0x868 + hi*20 table u16. */
typedef unsigned short u16;
struct F0222b954_Self { u16 f0; };
extern u16 data_ov002_022cf1a2[];
extern int  func_ov002_021b3ecc(int lo, int hi, int f0);
extern void func_ov002_021d6808(void *self, int lo, int hi, int zero, int one);
extern void func_ov002_021de910(void *self, int lo, int hi);
extern void func_ov002_021de9d4(void *self, int lo, int hi);

int func_ov002_0222b954(struct F0222b954_Self *self) {
    int t  = *(int *)((char *)self + 0x14);
    int lo = t & 0xff;
    int hi = (int)(((u16)t >> 8) & 0xff);
    if (func_ov002_021b3ecc(lo, hi, self->f0) != 0) {
        switch (self->f0) {
        case 0x1700:
            func_ov002_021de910(self, lo, hi);
            break;
        case 0x1749:
            func_ov002_021de9d4(self, lo, hi);
            break;
        case 0x1703:
            if (*(u16 *)((char *)data_ov002_022cf1a2 + (lo & 1) * 0x868 + hi * 20) == 0)
                func_ov002_021d6808(self, lo, hi, 0, 1);
            break;
        }
    }
    return 0;
}
