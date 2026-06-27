/* CAMPAIGN-PREP candidate for func_02212fbc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: count must be :8 bitfield (lsl#24;lsr#24 NOT and#0xff); declare `i` before `acc` so acc=r7,i=r6; predicated body addne/orrne.
 *   risk:       reshape-able (DONE): plain (u8) cast -> and#0xff (2 sites) and acc/i regs swapped. The :8 bitfield + decl-order both required; with them verified byte-exact (9-reg loop).
 *   confidence: high
 */
/* func_ov002_02212fbc (ov002, cls D): loop i<(:8 count@+6); per-i query+gate, on
 * pass set bit (b1+(b0<<4)) of acc; publish acc. Always returns 0. */
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int idx, void *out);
extern int func_ov002_0225764c(void *self, int b0, int b1);
extern int func_ov002_021de9c0(int self, int acc);

struct S02212fbc {
    u16 _pad[3];
    u16 cnt : 8;          /* +6 low byte (lsl#24;lsr#24 via :8 bitfield) */
    u16     : 8;
};

int func_ov002_02212fbc(struct S02212fbc *self) {
    int i, acc, out, b0, b1;
    i = 0;
    acc = 0;
    while (i < (int)self->cnt) {
        if (func_ov002_0223df38(self, i, &out) != 0) {
            b0 = out & 0xff;
            b1 = ((u16)out >> 8) & 0xff;
            if (func_ov002_0225764c(self, b0, b1) != 0) {
                acc |= 1 << (b1 + (b0 << 4));
            }
        }
        i++;
    }
    func_ov002_021de9c0((int)self, acc);
    return 0;
}
