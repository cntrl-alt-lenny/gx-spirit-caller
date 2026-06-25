/* CAMPAIGN-PREP candidate for func_02230260 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     switch(fc@+0xc) cmp-chain, two bitfield-arg leaf calls
 *   risk:       021e104c called 2-arg here (only r0,r1 set) vs its 4-arg .c; switch on {1,2} stays a cmp chain (no jump table).
 *   confidence: med
 */
/* func_ov002_02230260: switch(self->fc): 1 -> 021e104c(b0,1); 2 -> 0226af38
 * (1-b0,1,1). return 0. */
typedef unsigned short u16;

struct S02230260 {
    u16 f0; u16 b0 : 1; u16 _r : 15;
    u16 _4; u16 _6; u16 _8; u16 _a; u16 fc;
};

extern void func_ov002_021e104c(int a, int b);
extern void func_ov002_0226af38(int a, int b, int c);

int func_ov002_02230260(struct S02230260 *self) {
    switch (self->fc) {
    case 1:
        func_ov002_021e104c(self->b0, 1);
        break;
    case 2:
        func_ov002_0226af38(1 - self->b0, 1, 1);
        break;
    }
    return 0;
}
