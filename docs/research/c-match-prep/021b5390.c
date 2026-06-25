/* CAMPAIGN-PREP candidate for func_021b5390 (ov016, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dense jump-table switch returning constants; default returns ptr
 *   risk:       the >3 default does 'bx lr' with r0=arg ptr unchanged -> return (int)p may type/codegen-diff; inner case-3 default also returns ptr
 *   confidence: med
 */
/* func_ov016_021b5390: map a state struct to a glyph/score code.
 *   switch (p->sel) {              // [p+0x1c], dense 0..3 -> addls pc table
 *     case 0: return p->x + 1;                            // [p+0x18]
 *     case 1: return p->x < 3 ? p->x + 4 : 13;
 *     case 2: return p->x < 3 ? p->x + 7 : 12;
 *     case 3:
 *       switch (p->x) { case 0: return 0; case 1: return 10; case 2: return 11; }
 *       break;
 *   }
 *   return (int)p;   // default arms leave r0 = the arg pointer untouched
 */

typedef struct ScoreObj {
    char pad[0x18];
    int  x;     /* +0x18 */
    int  sel;   /* +0x1c */
} ScoreObj;

int func_ov016_021b5390(ScoreObj *p) {
    switch (p->sel) {
    case 0:
        return p->x + 1;
    case 1:
        if (p->x < 3) return p->x + 4;
        return 13;
    case 2:
        if (p->x < 3) return p->x + 7;
        return 12;
    case 3:
        switch (p->x) {
        case 0: return 0;
        case 1: return 10;
        case 2: return 11;
        }
        break;
    }
    return (int)p;
}
