/* CAMPAIGN-PREP candidate for func_021cde38 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /2 base + in-loop acc/2 then /0x80; manual 2-word store; which=1
 *   risk:       permuter-class: nested in-loop signed divides (acc/2 then `asr#6;add lsr#25;asr#7` = /0x40 then /0x80) reconstruct as add-shift triples mwcc pairs unpredictably — already brief-302 .s wall.
 *   confidence: low
 */
/* func_ov004_021cde38 (ov004, class C): 4-iter OAM builder, asr shifts.
 * y = (a2<<0xb)/2 + 0x400; attrlo = (a1&0xff)|0x4000|0x80000000.
 * loop i:0..3, acc(=r7)+=0x200:
 *   p = y + acc/2; t = (p/0x80)/0x80 ... actually p/0x80 then >>7 once more;
 *   rec.attr01 = attrlo | ((a0&0x1ff)<<16); a0 += 0x20;
 *   rec.attr2  = t | 0x8000; func_02005dac(1, i)->{w0,h4} manual 2-word.
 * NOTE: already ships as .s (brief 302 wall). */
extern void *func_02005dac(int which, int idx);

void func_ov004_021cde38(int a0, int a1, int a2, int a3) {
    int y = (a2 << 0xb) / 2 + 0x400;
    int attrlo = (a1 & 0xff) | 0x4000 | 0x80000000u;
    int acc = 0;
    int i;
    (void)a3;
    for (i = 0; i < 4; i++) {
        int p = y + acc / 2;
        int t = (p / 0x40) / 0x80;
        unsigned int *slot;
        unsigned int attr01 = attrlo | (((unsigned int)a0 & 0x1ff) << 16);
        unsigned int attr2  = t | 0x8000;
        slot = (unsigned int *)func_02005dac(1, i);
        slot[0] = attr01;
        slot[1] = attr2;
        a0 += 0x20;
        acc += 0x200;
    }
}
