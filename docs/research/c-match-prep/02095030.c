/* CAMPAIGN-PREP candidate for func_02095030 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: scan copy of a2 in r4, index r5; loop guard i<8 && mask!=0 (test-at-bottom layout)
 *   risk:       reg-alloc shuffle: orig holds a0/a1/a2/a3 in r9/r8/r7/r6 (high callee-saved) so they survive the inner call; mwcc’s allocation of 4 live args + a3 spilled to [sp] may pick different regs. permuter-class.
 *   confidence: med
 */
// func_02095030 — for each set bit i in (r3 low byte) call func_02095bf8(i), then dispatch event 0xd
// r9=a0,r8=a1,r7=a2,r6=a3; r4=a2 copy scanned, r5=bit index

extern void func_02095bf8(int bit);
extern void func_02094c94(int ev, int a0, int a1, int a2, int a3);

void func_02095030(int a0, int a1, int a2, int a3) {
    int mask;
    int i;

    mask = a2;
    i = 0;
    while (i < 8 && mask != 0) {
        if (mask & 1)
            func_02095bf8(i);
        i = i + 1;
        mask = (unsigned int)mask >> 1;
    }
    func_02094c94(0xd, a0, a1, a2, a3);
}
