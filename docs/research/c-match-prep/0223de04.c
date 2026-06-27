/* CAMPAIGN-PREP candidate for func_0223de04 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield counter; if/else-if guard in source order; forward 3 args to 0223dc14
 *   risk:       021d86fc arg order: orig moves r3(=self->hdr counter byte) into the 3rd slot and r4(d) into r2 — the (c, counter, d) arg mapping is the likely divergence. reshape-able (swap the 021d86fc arg order to match r0..r3).
 *   confidence: med
 */
/* func_ov002_0223de04: guard (counter<5 -> 0223dc14 forward; ==5 -> seed ring
 * from ce288+0x494), then 021d86fc(b,c,d, counter), then hdr.count++.
 * 4 args (self,b,c,d) forwarded to 0223dc14. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Ent0223de04 {
    u16 f0;
    u16 f2;
    u16 f4;
    struct { u16 lo:8; u16 count:8; } hdr;   /* +6 */
    u16 ring[5];                              /* +8 */
};

extern char data_ov002_022ce288[];
extern void func_ov002_0223dc14(struct Ent0223de04 *self, int b, int c, int d);
extern void func_ov002_021d86fc(int a, int b, int c, int d);

void func_ov002_0223de04(struct Ent0223de04 *self, int b, int c, int d) {
    int count = self->hdr.count;
    if (count < 5) {
        func_ov002_0223dc14(self, b, c, d);
    } else if (count == 5) {
        self->ring[count] = (u16)*(int *)(data_ov002_022ce288 + 0x494);
    }
    func_ov002_021d86fc(b, c, self->hdr.count & 0xff, d);
    self->hdr.count = (self->hdr.count + 1) & 0xff;
}
