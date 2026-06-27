/* CAMPAIGN-PREP candidate for func_02291798 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     i=0..4 loop; reload self->bit0 each iter; unsigned <=1 guard; predicated return 1
 *   risk:       the hit-path 'return 1' is a PREDICATED early return (movne r0,#1; ldmneia) vs a branch to a shared ret-0 epilogue — the inline-vs-branch class core.h flags as unsteerable by C form. Also loop reg-alloc of i/self/cd524-base. permuter-class / .s-escape likely.
 *   confidence: low
 */
/* func_ov002_02291798: simple scan loop, bit0 bitfield, two calls (cls C).
 * for i in 0..4: if func_022575c8(self, self->bit0, i)==0 continue; if
 * (unsigned)((int*)(cd524+0x1e4))[i] <= 1 continue; if func_021c84a8(
 * self->bit0, i)!=0 return 1; return 0. self->bit0 is re-read each iter
 * (orig reloads ldrh+shift). Arg order: 022575c8(self, bit0, i); 021c84a8(
 * bit0, i). The bls is an UNSIGNED <=1 test. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0 : 1; u16 rest : 15; };
extern char data_ov002_022cd524[];
extern int  func_ov002_022575c8(struct S *self, int bit0, int i);
extern int  func_ov002_021c84a8(int bit0, int i);

int func_ov002_02291798(struct S *self) {
    int i;
    for (i = 0; i <= 4; i++) {
        if (func_ov002_022575c8(self, self->bit0, i) == 0)
            continue;
        if ((unsigned int)((int *)(data_ov002_022cd524 + 0x1e4))[i] <= 1)
            continue;
        if (func_ov002_021c84a8(self->bit0, i) != 0)
            return 1;
    }
    return 0;
}
