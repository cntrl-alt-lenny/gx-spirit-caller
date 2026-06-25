/* CAMPAIGN-PREP candidate for func_02097074 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field RMW in store order; halfword writes; tail call(p,2)
 *   risk:       struct layout fabricated and references f30 not declared (won't compile as-is); fix struct + keep store order c,30,38,36,34.
 *   confidence: low
 */
// func_02097074 — field RMW block then tail call
// Recipe: STORE-ORDER field writes (|=4, copy, zero, half stores), tail call.

typedef struct {
    unsigned char pad08[0x8];   // 0x00..0x07
    int f08;                    // 0x08
    unsigned char pad0c[0x0];   // (placeholder)
    int f0c;                    // 0x0c
    unsigned char gap10[0x24];  // 0x10..0x33
    unsigned short f34;         // 0x34
    unsigned short f36;         // 0x36
    int f38;                    // 0x38
} Obj02097074;

extern int func_020965ac(Obj02097074 *p, int mode);

int func_02097074(Obj02097074 *p, int v)
{
    p->f0c |= 0x4;
    p->f30 = p->f08;
    p->f38 = 0;
    p->f36 = 0;
    p->f34 = (unsigned short)v;
    return func_020965ac(p, 2);
}
