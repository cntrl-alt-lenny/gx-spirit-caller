/* CAMPAIGN-PREP candidate for func_02019604 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork + mla-stride base, three byte-field adds (accumulator order)
 *   risk:       mla base `(idx-1)*0x18+base` may fuse/split differently; 3 ldrb adds must accumulate f15+f14 then +f16 in this exact order
 *   confidence: med
 */
/* func_02019604: GetSystemWork table-element byte sum. r0 = idx. Element =
 * work_base + (idx-1)*0x18 (mla r2,(idx-1),#0x18,base). Returns the sum of the
 * three unsigned bytes at +0x14,+0x15,+0x16. asm accumulates add r0,r1(f14),r0(f15)
 * then add r0,r2(f16),r0 -> write (f14+f15)+f16 left-folded to match. Stride 0x18
 * modeled via a 24-byte element struct so mwcc emits the `mla` directly. */
extern char *GetSystemWork(void);
extern int  func_02019210(void *);

typedef struct { unsigned char pad[0x14]; unsigned char a, b, c; unsigned char rest[0x18 - 0x17]; } Elem02019604;

int func_02019604(void *o) {
    Elem02019604 *base = (Elem02019604 *)GetSystemWork();
    int idx = func_02019210(o);
    Elem02019604 *e = &base[idx - 1];
    return e->a + e->b + e->c;
}
