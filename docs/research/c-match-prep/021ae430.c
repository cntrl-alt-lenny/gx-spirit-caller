/* CAMPAIGN-PREP candidate for func_021ae430 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: indexed-guard early return, two 0x100 stack bufs, straight call args
 *   risk:       frame/decl-order: orig lays buf0 at sp+0 and buf1 at sp+0x100; mwcc may swap which buffer is low (last-declared lowest), flipping the two `add r0,sp,#0x0/#0x100` operands. reshape-able (swap buf0/buf1 declaration order if objdiff shows the offsets inverted).
 *   confidence: med
 */
/* func_ov002_021ae430 — guard on data_ov002_022cd744[idx]; if nonzero return
 * (tearing down the 0x200 frame), else 3 straight calls on stack buffers.
 * buf0 at sp+0 (0x100), buf1 at sp+0x100 (0x100).
 *   func_ov002_0229cfa0(&buf0);
 *   func_ov002_0229ce5c(&buf1, 0x108, &buf0);
 *   func_ov002_0229ade0(0x31, 0, &buf1, 0); */

extern unsigned int data_ov002_022cd744[];
extern void func_ov002_0229ade0(int, int, void *, int);
extern void func_ov002_0229ce5c(void *, int, void *);
extern void func_ov002_0229cfa0(void *);

void func_ov002_021ae430(int idx) {
    char buf0[0x100];
    char buf1[0x100];
    if (data_ov002_022cd744[idx] != 0)
        return;
    func_ov002_0229cfa0(buf0);
    func_ov002_0229ce5c(buf1, 0x108, buf0);
    func_ov002_0229ade0(0x31, 0, buf1, 0);
}
