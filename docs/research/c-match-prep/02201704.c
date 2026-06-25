/* CAMPAIGN-PREP candidate for func_02201704 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit bitfield guard; rsb invert (1-b0); two helper calls; b0 reload
 *   risk:       021bcd80 real arity unknown (3rd/4th arg guessed); trailing movne#1/moveq#0 + b0 reload reg-alloc; shipped as .s
 *   confidence: low
 */
/* func_ov002_02201704: kind(6-bit)==0x23 takes the inverted-arg path; else
 * call 021bcd80(b0,-1) as a guard first. Both paths call with r2=~0. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; };

extern int func_ov002_021bcd80(int a, int b, int c, int d);

int func_ov002_02201704(struct Self *self) {
    if (self->kind != 0x23) {
        if (func_ov002_021bcd80(self->b0, -1, 0, 0) == 0)
            return 0;
    }
    return func_ov002_021bcd80(1 - self->b0, -1, 0, 0) != 0;
}
