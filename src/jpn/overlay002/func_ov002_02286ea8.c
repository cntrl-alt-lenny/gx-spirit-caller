/* CAMPAIGN-PREP candidate for func_02286fb8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bit0 :1 bitfield (lsl#31;lsr#31) arg; guard chain; reload-each-use
 *   risk:       none material — VERIFIED byte-exact. b0 reloaded per use (3x ldrh) matches; 1-b0 gives rsb; canonical Ov002Self bit0 shape.
 *   confidence: high
 */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_021bbe70(int x);
extern int func_ov002_0227d570(int x, int y);
extern int func_ov002_021c3b70(int x, int y);

int func_ov002_02286ea8(struct Self *self) {
    if (func_ov002_021bbe70(1 - self->b0) == 0) return 0;
    if (func_ov002_0227d570(self->b0, 0) < 0) return 0;
    return func_ov002_021c3b70(self->b0, 4) != 0;
}
