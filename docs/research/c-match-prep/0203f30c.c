/* CAMPAIGN-PREP candidate for func_0203f30c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested if-range (cmp;cmp;subls;bxls) preserved; final '=' as ternary -> movne/moveq;rsb
 *   risk:       reshape-able: only-likely diverge is the tail `ch==0x3d ? 0:-1` lowering — orig does movne r0,#1;moveq r0,#0;rsb r0,#0. If mwcc picks mov/mvn instead, swap to (-(ch!=0x3d)). Lowest-risk fn in batch.
 *   confidence: med
 */
/* func_0203f30c — base64 char -> 6-bit value; '='->0, invalid->-1.
 * Class D: char-range branch ladder + subls/addls/bxls tail. Pure leaf. */
int func_0203f30c(int ch) {
    if (ch >= 0x41) {
        if (ch <= 0x5a) return ch - 0x41;          /* A-Z -> 0..25 */
    }
    if (ch >= 0x61) {
        if (ch <= 0x7a) return ch - 0x61 + 0x1a;   /* a-z -> 26..51 */
    }
    if (ch >= 0x30) {
        if (ch <= 0x39) return ch - 0x30 + 0x34;   /* 0-9 -> 52..61 */
    }
    if (ch == 0x2b) return 0x3e;                   /* '+' */
    if (ch == 0x2f) return 0x3f;                   /* '/' */
    return ch == 0x3d ? 0 : -1;                    /* '=' ->0 else -1 */
}
