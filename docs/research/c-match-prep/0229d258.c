/* CAMPAIGN-PREP candidate for func_0229d258 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: ldrsh signed-short args; reload each global pool; store result before 2nd convert; reuse tmp
 *   risk:       args are ldrsh (signed) at +0/+2 of each global; orig interleaves the first str r0 BEFORE the 2nd ldrsh pair — if mwcc sinks the store past the next call the schedule diverges. reshape-able (signed-short + store placement)
 *   confidence: med
 */
/* func_ov002_0229d258: two coordinate-convert pairs. For each source point
 * (data_020bff80 then data_020c1f80, each two signed shorts x,y):
 *   func_0208b0fc(&tmp, x, y); r = func_0207ef90(data_022d0f98, &tmp);
 *   store r to data_022d100c[+0] / [+4]. Stack tmp reused for both. */
extern char data_020bff80[];
extern char data_020c1f80[];
extern char data_ov002_022d0f98[];
extern char data_ov002_022d100c[];
extern int  func_0208b0fc(void *out, int x, int y);
extern int  func_0207ef90(void *a, void *pt);

void func_ov002_0229d258(void) {
    char tmp[0x10];
    func_0208b0fc(tmp, ((short *)data_020bff80)[0], ((short *)data_020bff80)[1]);
    *(int *)(data_ov002_022d100c + 0x0) = func_0207ef90(data_ov002_022d0f98, tmp);
    func_0208b0fc(tmp, ((short *)data_020c1f80)[0], ((short *)data_020c1f80)[1]);
    *(int *)(data_ov002_022d100c + 0x4) = func_0207ef90(data_ov002_022d0f98, tmp);
}
