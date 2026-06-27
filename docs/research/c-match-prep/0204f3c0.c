/* CAMPAIGN-PREP candidate for func_0204f3c0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload getter per store; zero-stores in exact offset order; Fill32; cmp mode,#2 tail
 *   risk:       Provided .s is TRUNCATED (size 952; asm ends at strb [r4+0x14]); the bne arm and all stores past +0x14 are missing/inferred. Visible part needs strict store-order. reshape-able + struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0204f3c0 (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload getter per store; emit zero-stores in EXACT asm offset order; Fill32 block; cmp r4,#2 tail
 *   risk:       SOURCE .s IS TRUNCATED (size=952 but asm ends mid-body at the cmp r4,#2 / strb [r4+0x14] tail) — the bne .L_20d4 arm and all stores past +0x14 are INFERRED/missing. Visible part: every store reloads func_020498f0(); strict store-ORDER must hold. struct-guessed + reshape-able (store order) — whole-func unverifiable while truncated.
 *   confidence: low
 */
/* func_0204f3c0 — main, cls D. Long zero-init: each field store is preceded by a
   fresh func_020498f0() reload (orig re-bl's the getter before EVERY store) and
   the stores appear in a fixed offset order. One non-zero store: a halfword
   func_020459f0(0x10000) result to ctx+0x100+0x7e. A Fill32(0, ctx+0x3cc, 0x98)
   clears a block. Then `if (mode==2)` copies ctx->count0d into a sub-struct.
   NOTE: the provided .s is TRUNCATED; the tail past +0x14 is reconstructed and
   must be re-derived from the full disassembly before trusting a byte-match. */
typedef unsigned char u8;
extern u8 *func_020498f0(void);
extern int func_020459f0(int v);
extern void Fill32(int val, void *dst, int n);

void func_0204f3c0(int mode)
{
    *(u8 *)(func_020498f0() + 0xc)   = 0;
    *(u8 *)(func_020498f0() + 0x17c) = 0;
    {
        u8 *p = func_020498f0();
        *(unsigned short *)(p + 0x100 + 0x7e) = (unsigned short)func_020459f0(0x10000);
    }
    *(int *)(func_020498f0() + 0x180) = 0;
    { u8 *p = func_020498f0(); *(int *)(p + 0x184) = 0; *(int *)(p + 0x188) = 0; }
    { u8 *p = func_020498f0(); *(int *)(p + 0x18c) = 0; *(int *)(p + 0x190) = 0; }
    *(u8 *)(func_020498f0() + 0x1a4) = 0;
    *(u8 *)(func_020498f0() + 0x1a9) = 0;
    *(u8 *)(func_020498f0() + 0x1aa) = 0;
    *(u8 *)(func_020498f0() + 0x1ab) = 0;
    *(u8 *)(func_020498f0() + 0x1ac) = 0;
    *(u8 *)(func_020498f0() + 0x1a7) = 0;
    *(u8 *)(func_020498f0() + 0x1a8) = 0;
    *(unsigned short *)(func_020498f0() + 0x100 + 0xb2) = 0;
    *(unsigned short *)(func_020498f0() + 0x100 + 0xb4) = 0;
    *(int *)(func_020498f0() + 0x1b8) = 0;
    { u8 *p = func_020498f0(); *(int *)(p + 0x1e0) = 0; *(int *)(p + 0x1e4) = 0; }
    { u8 *p = func_020498f0(); *(int *)(p + 0x1f0) = 0; *(int *)(p + 0x1f4) = 0; }
    Fill32(0, func_020498f0() + 0x3cc, 0x98);

    if (mode == 2) {                 /* .s truncated here; tail inferred */
        u8 *dst = func_020498f0();
        dst[0x14] = func_020498f0()[0xd];
        /* ... remaining stores past +0x14 are MISSING from the provided .s ... */
    }
}
