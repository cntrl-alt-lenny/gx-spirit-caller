/* CAMPAIGN-PREP candidate for func_021cd700 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: two nibble bitfields as (x<<19)>>28 / (x<<23)>>28 shift pairs; flag dispatch.
 *   risk:       reshape-able: orig computes both shift-lefts (r1,r2) before both lsr#28; arg-eval order may swap which nibble lands in r0 vs r1 -- swap the two call-arg expressions if so.
 *   confidence: med
 */
/* func_ov011_021cd700 (ov011, class D): dispatch on a flag, then either two
 * nibble bitfields from g403c[0x268] or a fixed 4-arg call.
 *   if (*(u32*)(021d4000+0x2a0) == 0) {
 *       x = *(u32*)(021d403c+0x268);
 *       func_ov011_021cd6e0((x>>9)&0xf, (x>>5)&0xf);   [lsl#13/lsr#1c, lsl#17/lsr#1c]
 *   } else {
 *       func_ov006_021b3804(*(u32*)(021d403c+0x214), 0, 0x1000, 0x80);
 *   }
 * arg0 uses the (x<<19)>>28 extract, arg1 the (x<<23)>>28 extract -- written as
 * shift pairs so mwcc emits the orig lsl;lsr rather than lsr;and. */
extern void func_ov011_021cd6e0(int a, int b);
extern void func_ov006_021b3804(int a, int b, int c, int d);
extern unsigned char data_ov011_021d4000[];
extern unsigned char data_ov011_021d403c[];

void func_ov011_021cd700(void) {
    unsigned int x;

    if (*(unsigned int *)(data_ov011_021d4000 + 0x2a0) == 0) {
        x = *(unsigned int *)(data_ov011_021d403c + 0x268);
        func_ov011_021cd6e0((int)((x << 19) >> 28), (int)((x << 23) >> 28));
    } else {
        func_ov006_021b3804(*(int *)(data_ov011_021d403c + 0x214),
                            0, 0x1000, 0x80);
    }
}
