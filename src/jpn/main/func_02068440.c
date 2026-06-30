/* CAMPAIGN-PREP candidate for func_02068440 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER: str word at +0x8, strh halfword at +0xc
 *   risk:       Field offsets guessed from a single store each; the halfword is u16 — if the real field is s16 the codegen is identical so low risk.
 *   confidence: high
 */
/* func_02068440: leaf two-field setter. Store int arg at +0x8,
 * store halfword arg at +0xc. */

typedef struct {
    char           _pad[0x8];
    int            f_8;        /* +0x08 */
    unsigned short f_c;        /* +0x0c */
} obj_020684b4_t;

void func_02068440(obj_020684b4_t *p, int a, unsigned short b) {
    p->f_8 = a;
    p->f_c = b;
}
