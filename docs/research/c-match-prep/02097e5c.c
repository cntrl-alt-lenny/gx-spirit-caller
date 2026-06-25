/* CAMPAIGN-PREP candidate for func_02097e5c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f8 store first, then 12-byte struct-assign (ldm/stm); flag on success
 *   risk:       reshape-able: the {r0,r1,r2} ldm/stm only emerges if the 3-word copy is a single struct assignment; if modeled as 3 scalar copies mwcc emits ldr/str x3. Struct grouping is the lever.
 *   confidence: med
 */
/* func_02097e5c - copy 3-word param block + dispatch + conditional flag.
 * Class C/D: the ldmia r1,{r0,r1,r2}/stmia r3 is a 12-byte block copy
 * of fields +0x30..+0x38 from src; f8 is copied first (separate ldr/str).
 * Recipe: keep f8 store first, then a struct-assign of the 3-word group
 * so mwcc picks ldm/stm; flag set only on success (cmp r0,#0). */

typedef struct Triple { int a, b, c; } Triple;

typedef struct Node {
    char _pad00[0x8];
    int  f8;            /* +0x8 */
    unsigned int fc;    /* +0xc flags */
    char _pad10[0x30 - 0x10];
    Triple grp30;       /* +0x30..+0x38 (3 words) */
} Node;

typedef struct Src {
    int  s0;            /* read into f8 */
    Triple grp;         /* the 3-word group */
} Src;

extern int func_02097848(Node *o, int mode);

int func_02097e5c(Node *o, Src *s) {
    o->f8 = s->s0;
    o->grp30 = s->grp;
    if (func_02097848(o, 2) != 0) {
        o->fc |= 0x20;
        return 1;
    }
    return 0;
}
