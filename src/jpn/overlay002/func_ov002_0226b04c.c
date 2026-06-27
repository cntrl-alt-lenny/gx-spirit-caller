/* CAMPAIGN-PREP candidate for func_0226b13c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single u16-zext tail-call shim, zero 4th arg
 *   risk:       Low: matches the 0226b274 single-cast tail-call idiom; only arg2 param is unused/dropped
 *   confidence: high
 */
/* func_ov002_0226b04c: forward (u16)arg1 to the command sink func_ov002_0226ac08
 * with kind 0xc and a zero payload tail (r3=0). Pure tail-call shim.
 * (Note: the EUR original is a single-u16 zext, NOT the byte-pack that the USA
 * port of this address uses.) */
typedef unsigned short u16;
extern int func_ov002_0226ac08(int a, int b, int c, int d);
int func_ov002_0226b04c(int arg0, int arg1, int arg2) {
    return func_ov002_0226ac08(arg0, 0xc, (u16)arg1, 0);
}
