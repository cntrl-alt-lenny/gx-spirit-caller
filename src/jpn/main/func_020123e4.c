/* CAMPAIGN-PREP candidate for func_020123e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     0x108 struct copy to stack via by-value local, then tail func_02012180(&t)
 *   risk:       stack-copy lowered as ldmia/stmia x16 + tail-2 loop; mwcc may pick a plain memcpy loop or different frame size
 *   confidence: med
 */
/* func_020123e4: snapshot the caller's 0x108-byte record onto the
 * stack and pass it to func_02012180. mwcc lowers the by-value copy to
 * the ldmia r4!/stmia lr! 4-word loop (count 0x10) plus a trailing
 * 2-word copy. */

typedef struct { int w[66]; } Rec108;   /* 66*4 = 0x108 */
extern void func_02012180(Rec108 *p);

void func_020123e4(Rec108 *src) {
    Rec108 t = *src;
    func_02012180(&t);
}
