/* CAMPAIGN-PREP candidate for func_022912c8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tail-call thunk; :1 bitfield arg; bx ip
 *   risk:       struct field offset (f2 at #2) and bit0:1 width guessed; tail sig void* assumed
 *   confidence: high
 */
/* func_ov002_022912c8: tail-call thunk forwarding self->f2.bit0. */

struct F022912c8_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F022912c8_Self { unsigned short f0; struct F022912c8_F2 f2; };

extern int func_ov002_0227da98(unsigned int bit0);

int func_ov002_022912c8(struct F022912c8_Self *self) {
    return func_ov002_0227da98(self->f2.bit0);
}
