/* CAMPAIGN-PREP candidate for func_021ac8b0 (ov000, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: init loop strb post-inc (rows[i][0]=0), struct +0x98 RMW set-bit/clear/or in order
 *   risk:       the loop uses a single post-indexed `strb r0,[r3],#0x40` while storing ptr via `str r3,[r1,r2<<2]`; mwcc may split into separate base + i*0x40 instead of one walking pointer — reshape-able (use a `char*` cursor advanced by 0x40), else reg-alloc divergence.
 *   confidence: med
 */
/* func_ov000_021ac8b0 — build 4 row-pointers on a 0x110 stack frame, each
 * pointing 0x40 apart into a 0x100 block, zero each row's first byte; then
 * func_ov000_021b0e74_unk(a1), func_ov000_021ac920(a0, &ptrs, a2); then RMW
 * field +0x98 of *a0: set bit28, clear low byte, OR in (a1 & 0xff).
 * Frame: ptrs[4] at sp+0 (top), rows block 0x100 at sp+0x10. r5=a2,r6=a1,r4=a0
 * declared in that asm save order. */

extern void func_ov000_021b0e74_unk(int);
extern void func_ov000_021ac920(int *obj, void *ptrs, int a2);

struct Ov000Ac8b0Obj { char _pad[0x98]; unsigned int f_98; };

void func_ov000_021ac8b0(int *a0, int a1, int a2) {
    char rows[4][0x40];
    char *ptrs[4];
    int i;
    for (i = 0; i < 4; i++) {
        ptrs[i] = rows[i];
        rows[i][0] = 0;
    }
    func_ov000_021b0e74_unk(a1);
    func_ov000_021ac920(a0, ptrs, a2);
    ((struct Ov000Ac8b0Obj *)a0)->f_98 =
        (((struct Ov000Ac8b0Obj *)a0)->f_98 | 0x10000000u) & ~0xffu | (a1 & 0xff);
}
