/* CAMPAIGN-PREP candidate for func_020628b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: byte-pair from &data_02101530, strb hdr0/hdr1/0x68
 *   risk:       the len=3 outgoing STACK arg (str ip,[sp]) plus the {0x68,3} mov scheduling around the two strb's may reorder vs orig -- reshape-able (matches known func_020628fc ref shape; nudge buf/len init order).
 *   confidence: high
 */
/* func_020628b0 (cls D, size 0x4c): build {0xfe,0xfe,0x68} packet on stack,
 * forward (a,b,c) untouched, call func_020645e0(a,b,c, buf, 3).
 *
 * data_02101530 == 0xfefe, read byte-wise: buf[0]=hdr[0]; buf[1]=hdr[1].
 * Signature of this fn fixed by existing ref func_020628fc.c:
 *   func_020628b0(int a, int b, unsigned short c).
 * Store order in asm: strb hdr0; strb hdr1; strb 0x68; (then str len on stack).
 */

typedef unsigned char u8;

extern int data_02101530;
extern int func_020645e0(int a, int b, unsigned short c, void *buf, int len);

int func_020628b0(int a, int b, unsigned short c)
{
    u8  buf[4];
    const u8 *hdr = (const u8 *)&data_02101530;

    buf[0] = hdr[0];
    buf[1] = hdr[1];
    buf[2] = 0x68;
    return func_020645e0(a, b, c, buf, 3) != 0;
}
