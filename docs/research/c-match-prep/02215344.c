/* CAMPAIGN-PREP candidate for func_02215344 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested counted loop; guard-then-call; u16 stacked args 2/0; self->f0 arg
 *   risk:       stacked-arg store order (2 then 0) and constant hoist must match; self->f0 reloaded inside loop by the call barrier
 *   confidence: high
 */
/* func_ov002_02215344: nested loop i in [0,2), j in [0,5); guard func_0225764c
 * (self,i,j) then func_021d5a08(self,i,j,self->f0,2,0). Returns 0.
 *
 *   stacked u16 args 2 and 0 hoisted (r5=2,r4=0); r3=self->f0 (ldrh) reloaded.
 */
typedef unsigned short u16;

struct F02215344_Self { u16 f0; };

extern int func_ov002_0225764c(struct F02215344_Self *self, int a, int b);
extern int func_ov002_021d5a08(struct F02215344_Self *self, int a, int b,
                               int c, u16 d, u16 e);

int func_ov002_02215344(struct F02215344_Self *self) {
    int i, j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 5; j++) {
            if (func_ov002_0225764c(self, i, j)) {
                func_ov002_021d5a08(self, i, j, self->f0, 2, 0);
            }
        }
    }
    return 0;
}
