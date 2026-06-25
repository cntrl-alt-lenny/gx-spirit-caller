/* CAMPAIGN-PREP candidate for func_0226b258 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single u16-zext tail-call shim, zero 4th arg
 *   risk:       Low: identical idiom to 0226b13c, only the kind immediate differs (0x16)
 *   confidence: high
 */
/* func_ov002_0226b258: forward (u16)arg1 to the command sink func_ov002_0226acf8
 * with kind 0x16 and a zero payload tail (r3=0). Pure tail-call shim. */
typedef unsigned short u16;
extern int func_ov002_0226acf8(int a, int b, int c, int d);
int func_ov002_0226b258(int arg0, int arg1, int arg2) {
    return func_ov002_0226acf8(arg0, 0x16, (u16)arg1, 0);
}
