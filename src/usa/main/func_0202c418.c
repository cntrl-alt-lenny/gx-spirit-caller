/* CAMPAIGN-PREP candidate for func_0202c418 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     pointer-chase via .p1, stride-8 indexed read + base add
 *   risk:       two-ldr (no ldmia) needs the +4 gap; add operand order base8-first must hold
 *   confidence: high
 */
/* func_0202c418: p = data_0219a85c.p1; return p->base8 + p->arr[idx].v4;
 * arr (stride 8, field @+4) at p+0x0, base8 at p+0x8 (gap at +4 -> two
 * separate ldr, no ldmia). Sibling of matched func_0202c3f8/func_0202b778. */

typedef struct Elem0202c46c {
    char _pad_00[0x4];
    int  v4;             /* +0x4 (stride 8) */
} Elem0202c46c;

typedef struct Inner0202c46c {
    Elem0202c46c *arr;   /* +0x0 */
    char          _pad_04[0x4];
    char         *base8; /* +0x8 */
} Inner0202c46c;

typedef struct Ctx0202c46c {
    char           _pad_00[0x4];
    Inner0202c46c *p1;   /* +0x4 */
} Ctx0202c46c;

extern Ctx0202c46c data_0219a85c;

char *func_0202c418(int idx) {
    Inner0202c46c *p = data_0219a85c.p1;
    return p->base8 + p->arr[idx].v4;
}
