/* CAMPAIGN-PREP candidate for func_020939a4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :3/:4 bitfields, byte/halfwidth field copies in asm store-order
 *   risk:       permuter-class: orig hoists `mov r2,#0x14` (1st copy len) into the bitfield-extract block and interleaves field stores; mwcc scheduling of the const-arg + store order likely diverges. struct-guessed src/dst offsets.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020939a4 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Drop into src/, ninja+objdiff, apply risk note.
 *   recipe: :3/:4 bitfield extracts (lsl;lsr) + width-changing field copies, asm store-order; two func_020944a4 block-copies.
 *   risk:   permuter-class scheduling of `mov r2,#0x14` hoist + store interleave; struct-guessed offsets.
 *   confidence: low
 */
/* func_020939a4: copy a config record out of the HW block @0x027ffc80 into
 * *out (r4). Two narrow bitfields (:3 from u16@0x64, :4 from u8@0x02), four
 * byte copies (two widening u8->u16), and two func_020944a4 block copies. */

typedef struct {
    unsigned char  _p00[2];
    unsigned char  f02 : 4;          /* +0x02 ldrb,lsl#28,lsr#28 */
    unsigned char  f03;              /* +0x03 */
    unsigned char  f04;              /* +0x04 */
    unsigned char  _p05;
    unsigned char  f06;              /* +0x06 block-copy src (0x14 bytes) */
    unsigned char  _p07[0x13];
    unsigned char  f1a;              /* +0x1a */
    unsigned char  _p1b;
    unsigned char  f1c;              /* +0x1c block-copy src (0x34 bytes) */
    unsigned char  _p1d[0x33];
    unsigned char  f50;              /* +0x50 */
    unsigned char  _p51[0x13];
    unsigned short f64 : 3;          /* +0x64 ldrh,lsl#29,lsr#29 */
} HwSrc_27ffc80;

typedef struct {
    unsigned char  g00;              /* +0x00 (:3 value) */
    unsigned char  g01;              /* +0x01 (:4 value) */
    unsigned char  g02;              /* +0x02 */
    unsigned char  g03;              /* +0x03 */
    unsigned char  g04;              /* +0x04 block-copy dst (0x14) */
    unsigned char  _p05[0x14];
    unsigned short g18;              /* +0x18 strh */
    unsigned char  g1a;              /* +0x1a block-copy dst (0x34) */
    unsigned char  _p1b[0x34];
    unsigned short g4e;              /* +0x4e strh */
} OutRec;

#define HW ((HwSrc_27ffc80 *)0x027ffc80)

extern void func_020944a4(void *src, void *dst, int n);

void func_020939a4(OutRec *out) {
    HwSrc_27ffc80 *hw = HW;
    out->g00 = hw->f64;
    out->g01 = hw->f02;
    out->g02 = hw->f03;
    out->g03 = hw->f04;
    out->g18 = hw->f1a;
    out->g4e = hw->f50;
    func_020944a4(&hw->f06, &out->g04, 0x14);
    func_020944a4((char *)hw + 0x1c, &out->g1a, 0x34);
}
