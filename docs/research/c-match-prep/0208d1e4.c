/* CAMPAIGN-PREP candidate for func_0208d1e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     OR arg into global (global-first) then indirect tail call
 *   risk:       tail call materialized as `bx ip` (indirect) — mwcc emits this for return helper(); arg width u16 vs int could change orr; data type guessed u16
 *   confidence: med
 */
/* func_0208d1e4: OR arg bits into data_021a6304 (orig `orr r2,r2,r0`
 * = global | arg), then tail-call func_0208dce4.
 *
 *     *(u16*)data_021a6304 |= r0;
 *     return func_0208dce4(...);   (tail, bx ip)
 */

extern unsigned short data_021a6304;
extern int func_0208dce4(int bits);

int func_0208d1e4(int bits) {
    data_021a6304 |= bits;
    return func_0208dce4(bits);
}
