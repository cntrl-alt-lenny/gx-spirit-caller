/* CAMPAIGN-PREP candidate for func_0208b000 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed+unsigned bounds guards, *12 index, sentinel if-assign
 *   risk:       compiler may not emit mul-by-12 (could use add/shift) and may reorder the address compute; struct layout assumed
 *   confidence: med
 */
/* func_0208b000 — bounds-checked lookup into an array of 12-byte
 * records at +0x20, count at +0x1c. Returns &array[i], or NULL if i is
 * out of range or the record's first word is -1 (empty sentinel).
 *
 *   cmp r1,#0; movlt r0,#0; bxlt lr            ; i < 0 -> NULL
 *   ldr r2,[r0,#0x1c]; cmp r1,r2; movcs r0,#0; bxcs lr  ; i>=count -> NULL
 *   r2=r1*12; r3=r0+0x20; r1=[r3,r2]           ; r1 = array[i].field0
 *   mvn r0,#0; cmp r1,r0; r0=r3+r2; moveq r0,#0; bx lr  ; ==-1 -> NULL
 *
 * cmp/movcs against the count is an UNSIGNED compare, so the index is
 * compared as unsigned after the signed `< 0` guard. The element
 * address r3+r2 is computed unconditionally and nulled on the sentinel
 * match (if-assign, not ternary).
 */
#include <nitro/types.h>

typedef struct Elem_0208b000 {
    s32 id;             /* +0x00, -1 == empty */
    s32 a;
    s32 b;
} Elem_0208b000;

typedef struct Tab_0208b000 {
    u8  _pad0[0x1c];
    s32 count;          /* +0x1c */
    Elem_0208b000 elems[1];  /* +0x20 */
} Tab_0208b000;

Elem_0208b000 *func_0208b000(Tab_0208b000 *t, int i) {
    Elem_0208b000 *e;
    if (i < 0) return 0;
    if ((u32)i >= (u32)t->count) return 0;
    e = &t->elems[i];
    if (e->id == -1) return 0;
    return e;
}
