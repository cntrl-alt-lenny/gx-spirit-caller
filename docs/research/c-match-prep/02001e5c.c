/* CAMPAIGN-PREP candidate for func_02001e5c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR (signed-byte) + double-negation bool (!(p&&*p))
 *   risk:       movne/moveq order for the !(...) may flip; field offset 0x28 assumed pointer.
 *   confidence: med
 */
/* func_02001e5c: bool accessor. Loads ptr at +0x28; result is
 * !(ptr && *(signed char*)ptr). The cmp/movne/moveq chain is the
 * canonical mwcc lowering of a doubly-negated && expression.
 *
 *   ldr   r0,[r0,#0x28]
 *   cmp   r0,#0
 *   ldrnesb r0,[r0]
 *   cmpne r0,#0
 *   ... -> return !(p->q && *p->q)
 */
typedef struct {
    char         _pad_00[0x28];
    signed char *q;            /* +0x28 */
} obj_t;

int func_02001e5c(obj_t *p) {
    signed char *q = p->q;
    return !(q && *q);
}
