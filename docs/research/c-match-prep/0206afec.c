/* CAMPAIGN-PREP candidate for func_0206afec (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: byte-serialize value (strb in order) via &val; advance src then dst cursor
 *   risk:       reshape-able: orig reads value bytes from the spilled arg block (stmdb {r0-r3}); taking &val should reproduce that spill, but mwcc may instead keep val in a reg and not spill — then the 4 strb sources differ.
 *   confidence: med
 */
/* func_0206afec — serialize a 4-byte value into *dst and advance two cursors.
 *   args: r0=dstpp (u8** ), r1=val(by value, 4 bytes), r2=srcpp (u8** ).
 *   d = *dstpp;
 *   d[0]=valbytes[0]; d[1]=valbytes[1]; d[2]=valbytes[2]; d[3]=valbytes[3];
 *   *srcpp += 4;
 *   *dstpp += 4;
 * Orig spills incoming r0-r3 and reads the value bytes from the spilled r1 slot
 * (ip=sp+0xc); the dst pointer comes from the live r0 (=*r0).
 */
typedef unsigned char u8;

int func_0206afec(u8 **dstpp, unsigned int val, u8 **srcpp)
{
    u8 *vb = (u8 *)&val;
    u8 *d = *dstpp;
    d[0] = vb[0];
    d[1] = vb[1];
    d[2] = vb[2];
    d[3] = vb[3];
    *srcpp += 4;
    *dstpp += 4;
    return 0;
}
