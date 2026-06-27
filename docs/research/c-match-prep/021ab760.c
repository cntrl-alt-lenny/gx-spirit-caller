/* CAMPAIGN-PREP candidate for func_021ab760 (ov022, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: keep S on the stack, write after +bias, after <=0, after >255 (3 stores); if-assign clamps not ternary; unsigned count via &0xffff
 *   risk:       Orig re-reads/re-stores the S stack slot 3x and interleaves the ldr sp[8] (H) mid-clamp; mwcc may keep S in a reg and emit one store, dropping 2 str (reshape-able: take &S / force stack via the address-of in the out-param call already does this).
 *   confidence: med
 */
/* ov022 021ab760 — class D: clamp loop, lsl/lsr halfword unpack.
 * r0=src(u16*), r1=dst(u16*), r2 packed: low16=count, high16=base(bias+0x100).
 * Per element: decode src -> (H,S,V) via 021ab4b0 out-params, bias+clamp S,
 * repack via 021ab5c8 (HSV->RGB), store. Store-order: 3 writes to S slot. */

extern void func_ov022_021ab4b0(int in, int *outH, int *outS, int *outV);
extern unsigned short func_ov022_021ab5c8(int h, int s, int v);

void func_ov022_021ab760(unsigned short *src, unsigned short *dst, unsigned int packed) {
    int count = packed & 0xffff;                 /* lsl#16;lsr#16 -> count */
    int bias  = ((packed >> 16) & 0xffff) - 0x100; /* lsr#16;lsl#16;lsr#16 - 0x100 */
    int i = 0;
    int H, S, V;

    if (count <= 0) return;                       /* cmp r7,#0 ; addle/ldmle early-out */

    do {
        func_ov022_021ab4b0((int)*src, &H, &S, &V); /* out: sp8=H, sp4=S, sp0=V */
        S = S + bias;                               /* str sp4 */
        if (S <= 0) S = 0;                          /* movle ; str sp4 */
        if (S > 255) S = 255;                       /* movgt ; str sp4 */
        *dst = func_ov022_021ab5c8(H, S, V);
        dst++;                                      /* strh [r9],#2 */
        src++;                                      /* add sl,#2 */
        i++;
    } while (i < count);
}
