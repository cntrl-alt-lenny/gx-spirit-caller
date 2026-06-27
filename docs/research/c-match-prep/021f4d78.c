/* CAMPAIGN-PREP candidate for func_021f4d78 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch on G->state (+0x5b4); single call bound to local r (no double-call); parity :1 bitfield; bodies match
 *   risk:       dispatch SHAPE: orig lays default body INLINE (fall-through) with 0xa/0xb cases at tail and keeps state in r2; my switch puts cases first + extra `b default` and uses r1. All bodies byte-match. permuter-class (block-placement + reg coin-flip).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f4d78 (ov002, class D) — MED tier.
 * BUILD-CHECKED (mwcc 2.0/sp1p5 -O4,p -interworking): all 3 case BODIES match the
 * delinked .o byte-for-byte; the only residue is dispatch SHAPE — orig lays the
 * default body inline (fall-through) with the 0xa/0xb cases at the tail and holds
 * state in r2; my switch lays cases first + an extra `b default` and uses r1.
 * recipe: switch on G->state (ce288 +0x5b4); default holds the call result and on
 * !=1 returns it, on ==1 sets state=0xa; state 0xa posts func_0226aff0(self->
 * parity,0xffff,1) then state++. self->parity = :1 bit0. */
typedef unsigned short u16;

struct Ov002Self { u16 f0; u16 parity : 1; };
struct Ov002G    { char _pad[0x5b4]; int state; };

extern struct Ov002G data_ov002_022ce288;
extern int  func_ov002_021f4a84(struct Ov002Self *self);
extern int  func_ov002_0226aff0(int a, int b, int c);

int func_ov002_021f4d78(struct Ov002Self *self) {
    int r;
    switch (data_ov002_022ce288.state) {
    case 0xa:
        func_ov002_0226aff0(self->parity, 0xffff, 1);
        data_ov002_022ce288.state++;
        return 0;
    case 0xb:
        return 1;
    default:
        r = func_ov002_021f4a84(self);
        if (r != 1)
            return r;
        data_ov002_022ce288.state = 0xa;
        return 0;
    }
}
