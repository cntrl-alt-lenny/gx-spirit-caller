/* CAMPAIGN-PREP candidate for func_0221b278 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two 0223df38 out-locals; byte-unpack each; smulbb hi*20 gates; signed const-div halve; stacked u16 args
 *   risk:       asm AND literal pool are truncated mid-body: _LIT2 divisor magic unknown (guessed /9) and 2nd 021d5a08 tail inferred. struct-guessed (confirm divisor) + permuter-class.
 *   confidence: low
 */
/* func_ov002_0221b278 (cls D): bit2(self+4) guard; resolve TWO records (idx 0
 * and 1) via 0223df38; unpack lo/hi bytes of each; 021c8470(lo,hi)+1; two
 * cf1a4 :13-stride gates (smulbb hi*20); a signed /K halve; emit two 021d5a08
 * calls with stacked (2, halfword). NOTE: asm + literal pool truncated. */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 _r : 15; };

extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c8470(int a, int b);
extern int  func_ov002_021d5a08(void *self, int a, int b, int slot, u16 mode, u16 cell);
extern int  func_ov002_0223df38(void *self, int idx, int *out);

int func_ov002_0221b278(struct Self *self) {
    int p1, p2, a_lo, a_hi, b_lo, b_hi, base, cell;
    if (((*(u16 *)((char *)self + 4) >> 2) & 1) != 0) return 0;
    if (func_ov002_0223df38(self, 0, &p1) == 0) return 0;
    if (func_ov002_0223df38(self, 1, &p2) == 0) return 0;
    a_lo = p1 & 0xff;
    a_hi = ((u16)p1 >> 8) & 0xff;
    b_lo = p2 & 0xff;
    b_hi = ((u16)p2 >> 8) & 0xff;
    base = func_ov002_021c8470(a_lo, a_hi) + 1;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + (a_lo & 1) * 0x868 + a_hi * 0x14) == 0)
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + (b_lo & 1) * 0x868 + b_hi * 0x14) == 0)
        return 0;
    cell = (base >> 1) / 9 * 2;  /* magic divisor (smull;asr#2) — value truncated from pool */
    func_ov002_021d5a08(self, a_lo, a_hi, *(u16 *)self, 2, (u16)cell);
    func_ov002_021d5a08(self, b_lo, b_hi, *(u16 *)self, 2, (u16)(cell + 1));
    return 0;
}
