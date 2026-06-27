/* CAMPAIGN-PREP candidate for func_02204db8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 + :5 bitfields from one read; (bit0&1)*0x868 table (cf. 02205508); unsigned <4 for movcc
 *   risk:       struct-guessed: b1_5 :5 field (bits1-5) and d016c+0xcec offset inferred. If mwcc reloads [self,#2] for the b1_5 extract in the eq-branch (orig holds r3), one ldrh diverges.
 *   confidence: med
 */
/* func_ov002_02204db8: cls D — bit0 vs global; else table-lookup<4; branch tail.
 * if (*(int*)(d016c+0xcec) == bit0) -> tail 021b3ecc(f0, b1_5);
 * else v = *(int*)(cf178 + (bit0&1)*0x868); return v < 4.
 * f2 [self,#2] held live (r3) across branch -> single read, two extracts. */
typedef unsigned short u16;
struct S02204db8 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 rest:10; };
extern char data_ov002_022cf178[];
extern char data_ov002_022d016c[];
extern int func_ov002_021b3ecc(int f0, int b1_5);
int func_ov002_02204db8(struct S02204db8 *self) {
    if (*(int *)(data_ov002_022d016c + 0xcec) == self->bit0) {
        return func_ov002_021b3ecc(self->f0, self->b1_5);
    }
    return *(unsigned int *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868) < 4;
}
