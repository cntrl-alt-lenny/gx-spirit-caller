/* CAMPAIGN-PREP candidate for func_0221d028 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     asymmetric-shift extracts (raw C, no fold); mla per-player base; equality guard; single call
 *   risk:       reshape-able: the (h4>>2)&1 gate may fold to 'and' not 'lsl#29;lsr#31' — if so re-type as struct{u16:2;u16 b:1;} bitfield. asymmetric shifts are fold-safe.
 *   confidence: med
 */
/* func_ov002_0221d028 (ov002, class D) — guard then a bitfield equality
 * check against a per-player slot record, then a single MMIO call. r0=self.
 * h4 at +4: bit2 gates (return 0). h2 at +2: bit0 = player, bits[1..5] =
 * slot. record = *(int*)(cf16c + player*0x868 + slot*0x14 + 0x30). Compare
 * lhs=(h4>>6)&0x1ff against rhs=((rec>>22)&0xff)<<1 + ((rec>>13)&1).
 * Match -> func_021de408(self, 0x04000400). */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021de408(void *self, int reg);

struct Self028 { unsigned short f0; unsigned short f2; unsigned short f4; };

int func_ov002_0221d028(void *self) {
    struct Self028 *s = (struct Self028 *)self;
    unsigned int h2, h4, player, slot, rec, lhs, rhs;
    int *base;
    h4 = s->f4;
    if ((h4 >> 2) & 1) return 0;
    h2 = s->f2;
    player = h2 & 1;
    slot = (h2 >> 1) & 0x1f;
    base = (int *)(data_ov002_022cf16c + player * 0x868 + slot * 0x14 + 0x30);
    rec = (unsigned int)*base;
    lhs = ((unsigned int)(h4 << 17)) >> 23;
    rhs = ((((unsigned int)(rec << 2)) >> 24) << 1) + (((unsigned int)(rec << 18)) >> 31);
    if (lhs != rhs) return 0;
    func_ov002_021de408(self, 0x04000400);
    return 0;
}
