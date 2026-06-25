/* CAMPAIGN-PREP candidate for func_02097238 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if/else-if cmov zeroing; ordered stores 0x54,0x58
 *   risk:       cmov vs branch shape: asm uses moveq+beq then moveq; mwcc may instead branch both arms; store offsets guessed.
 *   confidence: med
 */
// func_02097238 — mutually-exclusive zeroing then two stores
// Recipe: if-assign cmov pair, store a@0x54 b@0x58 in order.

typedef struct {
    unsigned char pad[0x54];
    int f54;
    int f58;
} Obj02097238;

void func_02097238(Obj02097238 *p, int a, int b)
{
    if (b == 0) {
        a = 0;
    } else if (a == 0) {
        b = 0;
    }
    p->f54 = a;
    p->f58 = b;
}
