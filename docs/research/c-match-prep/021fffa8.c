/* CAMPAIGN-PREP candidate for func_021fffa8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind bit0; compare-guards; pass-through tail call
 *   risk:       021ff320 real arity is 1 — declaring 2 args here to emit mov r1; 0xffff/-1 literal-pool loads
 *   confidence: high
 */
/* func_ov002_021fffa8: 021b3958(bit0, multi5) must == 0xffff; 021bd030(bit0)
 * must != -1; then tail-call 021ff320(self, arg1). bit0 bound to r6 across
 * both calls. 021ff320 declared 2-arg here so the caller passes arg1 (r1). */

struct F021fffa8_F2 {
    unsigned short b0     : 1;
    unsigned short multi5 : 5;
    unsigned short        : 10;
};
struct F021fffa8_Self {
    unsigned short f0;
    struct F021fffa8_F2 f2;
};

extern int func_ov002_021b3958(unsigned int bit0, unsigned int multi5);
extern int func_ov002_021bd030(unsigned int bit0);
extern int func_ov002_021ff320(struct F021fffa8_Self *self, int arg1);

int func_ov002_021fffa8(struct F021fffa8_Self *self, int arg1) {
    unsigned int b0 = self->f2.b0;
    if (func_ov002_021b3958(b0, self->f2.multi5) != 0xffff) return 0;
    if (func_ov002_021bd030(b0) == -1) return 0;
    return func_ov002_021ff320(self, arg1);
}
