/* CAMPAIGN-PREP candidate for func_022a5984 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch (jump-table) to tail calls + inc-field
 *   risk:       11-entry table with duplicate targets (cases 4..6,9 share); empty cases 0-2 must emit bare returns; default fallthrough order
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a5984 (ov002, class A).
 *   recipe:     DISPATCH switch over p->state (cmp #0xa) -> jump-table; cases
 *               tail-call helpers, several share a target, one bumps a field
 *   risk:       11-entry table with shared targets (4/5/6/10 -> same body);
 *               cases 0/1/2 are empty returns; table/default ordering must
 *               reproduce the asm's branch layout
 *   confidence: high
 */
/* func_ov002_022a5984: dispatch on p->state (0..10). 3:teardown-A,
 * 4..6,10:teardown-C, 7:close, 8/others:inc p->f_8. */

extern void func_ov002_022a4a30(void *p);
extern void func_ov002_022a4ed8(void *p);
extern void func_ov002_022a51e0(void *p);

typedef struct {
    int state;            /* +0x00 */
    char _pad_04[0x4];
    int f_8;              /* +0x08 */
} Ctx_022a5984;

void func_ov002_022a5984(Ctx_022a5984 *p) {
    switch (p->state) {
    case 0:
    case 1:
    case 2:
        return;
    case 4:
        func_ov002_022a4a30(p);
        return;
    case 3:
        func_ov002_022a4ed8(p);
        return;
    case 5:
    case 6:
    case 7:
        func_ov002_022a51e0(p);
        return;
    case 8:
    case 9:
    case 10:
    default:
        p->f_8 = p->f_8 + 1;
        return;
    }
}
