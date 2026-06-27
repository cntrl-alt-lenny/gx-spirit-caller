/* CAMPAIGN-PREP candidate for func_021add24 (ov020, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod: % 360 emits the 0xb60b60b7 smull+sub; bind reciprocal magic by hoisting (orig loads _LIT0/0x168 before loop); post-inc src; signed count via lsl16;lsr16
 *   risk:       Orig hoists the /360 magic (_LIT0) and 0x168 into callee-saved regs BEFORE the loop (ldr once); mwcc may re-materialize the constant inside the loop body, adding a per-iter ldr (reshape-able borderline / permuter-class if mwcc won't hoist). H/S/V slot reuse + post-inc ordering also fragile.
 *   confidence: low
 */
/* ov020 021add24 — class D: counted loop + divmod magic (0xb60b60b7 => %360).
 * r0=src(u16*), r1=dst(u16*), r2 packed: low16=count(signed via lsl/lsr),
 * high16=hue base. Per element: decode via 021ada74 out-params, wrap hue
 * (h+base)%360, repack via 021adb8c. */

extern void func_ov020_021ada74(int in, int *outH, int *outS, int *outV);
extern unsigned short func_ov020_021adb8c(int h, int s, int v);

void func_ov020_021add24(unsigned short *src, unsigned short *dst, unsigned int packed) {
    int count = (int)(packed << 16) >> 16;     /* mov lsl#16; lsr#16 -> count */
    int base  = (packed >> 16) & 0xffff;       /* r2>>16 then (lsl16;lsr16) */
    int i = 0;
    int H, S, V;

    if (count <= 0) return;                     /* cmp r8,#0 ; early-out */

    do {
        func_ov020_021ada74((int)*src, &H, &S, &V); /* sp8=H, sp4=S, sp0=V */
        src++;                                  /* ldrh [sl],#2 post-inc */
        H = (H + base) % 360;                    /* smull 0xb60b60b7 + sub q*360 */
        *dst = func_ov020_021adb8c(H, S, V);
        dst++;                                   /* strh [r9],#2 */
        i++;
    } while (i < count);
}
