/* CAMPAIGN-PREP candidate for func_02011178 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     struct value-copy (*dst=*src) -> auto self-assign guard + 12-word unroll
 *   risk:       mwcc might emit ldmia/stmia block instead of the per-word ldr/str unroll; arg order src=r0,dst=r1
 *   confidence: high
 */
/* func_02011178: copy a 0x30-byte (12-word) struct from src to dst;
 * mwcc emits the cmp src,dst / bxeq self-assignment guard then the
 * field-by-field unrolled copy. Leaf. */

typedef struct { int w[12]; } Rec12;

void func_02011178(Rec12 *src, Rec12 *dst) {
    *dst = *src;
}
