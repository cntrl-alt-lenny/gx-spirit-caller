/* CAMPAIGN-PREP candidate for func_022a6c34 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N member stores (RMW) in source order, then write-out, store-order kept
 *   risk:       struct-guessed: 5th arg is a u16 on the stack ([sp]); passing a struct-by-value to land it at [sp] may not match mwcc ABI — may need (u16) scalar 5th param + local. Insert order otherwise faithful.
 *   confidence: low
 */
/* func_ov002_022a6c34 (ov002, D) — build a packed u16 in a local, store to obj.
 * r0=obj, r1,r2,r3 = field values, [sp]=incoming u16 (stack arg, 5th). Inserts
 * a:1=r1, b:5=r2, c:8=r3 via RMW (each :N member store is ldrh;bic;orr;strh), then
 * sets bit14=1, clears bit15, writes the u16 to *(u16*)(obj+0x500+0x90), writes
 * 0x60 to *(int*)(obj+0x578), then func_0229a414(1). Store-order preserved. */
typedef unsigned short u16;
struct Hdr { u16 a : 1, b : 5, c : 8, e : 1, f : 1; };
extern void func_ov002_0229a414(int one);

void func_ov002_022a6c34(char *obj, int r1, int r2, int r3, struct Hdr h) {
    h.a = r1;
    h.b = r2;
    h.c = r3;
    h.e = 1;          /* orr #0x4000 (bit14) */
    h.f = 0;          /* bic #0x8000 (bit15) */
    *(u16 *)(obj + 0x500 + 0x90) = *(u16 *)&h;
    *(int *)(obj + 0x578) = 0x60;
    func_ov002_0229a414(1);
}
