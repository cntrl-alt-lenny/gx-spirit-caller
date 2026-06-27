/* CAMPAIGN-PREP candidate for func_021d0dac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     linear call sequence verbatim; guard early-return; literal args in place; reload base for final clear
 *   risk:       reshape-able-ish: orig emits a DEAD `ldrh r1,[ce950+2]` (loaded, never used) in the prologue — mwcc drops dead loads, so 1 ldrh diverges. No clean C forces it; likely needs .s escape or a side-effecting read.
 *   confidence: med
 */
/* func_ov002_021d0dac: one-shot init guard on ce950+0x810. If the counter is
 * already nonzero, no-op. Else run the open sequence (021c9af0(2); 021ba7c4(0);
 * 021ba7c4(1); two 0x14 events) and clear +0x80c.
 * NOTE: orig also does a dead `ldrh r1,[ce950+2]` before the guard — a leftover
 * load with no use; mwcc will NOT emit it (see risk). */

extern char data_ov002_022ce950[];
extern void func_ov002_021ba7c4(int a);
extern void func_ov002_021c9af0(int a);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021d0dac(void) {
    if (*(int *)(data_ov002_022ce950 + 0x810) != 0) return;
    func_ov002_021c9af0(2);
    func_ov002_021ba7c4(0);
    func_ov002_021ba7c4(1);
    func_ov002_0229ade0(0x14, 0, 0xd, 0);
    func_ov002_0229ade0(0x14, 1, 0xd, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
