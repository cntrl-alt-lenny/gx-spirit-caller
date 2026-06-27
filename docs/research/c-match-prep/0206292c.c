/* CAMPAIGN-PREP candidate for func_0206292c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: byte hdr, literal-3 first call, running len 0->5->7
 *   risk:       orig schedules 'len+=5' between cmp r7,r6 and beq (add r5,#5 before branch); and first call's 2nd arg is literal 3 not len. If mwcc folds len init differently the add placement diverges -- reshape-able.
 *   confidence: med
 */
/* func_0206292c (cls D, size 0x8c): build {0xfe,0xfe,0x65} packet, write p1 at
 * offset 3, conditionally write p2, then commit via func_02062280.
 *
 * data_02101530 == 0xfefe read byte-wise.  Running length `len`: 0 -> 5 -> 7.
 * First func_02064490 uses literal offset 3; second uses `len`.
 * Store order: hdr0, hdr1, 0x65.
 */

typedef unsigned char u8;

extern int data_02101530;
extern int func_02064490(void *buf, int off, int val);
extern int func_02062280(void *obj, void *buf, int len);

int func_0206292c(void *obj, int p1, int p2)
{
    u8  buf[4];
    const u8 *hdr = (const u8 *)&data_02101530;
    int len = 0;

    buf[0] = hdr[0];
    buf[1] = hdr[1];
    buf[2] = 0x65;
    func_02064490(buf, 3, p1);
    len += 5;
    if (p1 != p2) {
        func_02064490(buf, len, p2);
        len += 2;
    }
    return func_02062280(obj, buf, len) != 0;
}
