/* CAMPAIGN-PREP candidate for func_0206bf94 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: alloc(kind), null-guard, then field stores tag/obj/0/f73/kind in order
 *   risk:       store-order: orig allocates with r4=kind then writes p[0..0xd] in fixed order; the ldrsb obj->f73 (signed) into byte p[0xc] and strb kind into p[0xd] must stay adjacent and last. reshape-able (reorder C stores / signedness). struct-guessed offsets.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206bf94 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: allocate via callee(kind); on success emit field stores in asm order
 * func_0206bf94(tag, obj, kind): p = func_0206bfdc(kind); if(!p) return 0;
 *   p[0]=tag; p[4]=obj; p[8]=0; (s8)p[0xc]=obj->f73; (u8)p[0xd]=kind; return p.
 * Stores MUST stay in this order (tag, obj, 0, f73 byte, kind byte).
 */
typedef struct {
    char _pad_00[0x73];
    signed char f73;   /* +0x73 ldrsb */
} Obj;

typedef struct {
    void *p00;          /* +0x0  tag   */
    void *p04;          /* +0x4  obj   */
    int   w08;          /* +0x8  =0    */
    signed char b0c;    /* +0xc  obj->f73 */
    unsigned char b0d;  /* +0xd  kind  */
} Node;

extern Node *func_0206bfdc(int kind);

Node *func_0206bf94(void *tag, Obj *obj, int kind) {
    Node *p = func_0206bfdc(kind);
    if (p == 0) return 0;
    p->p00 = tag;
    p->p04 = obj;
    p->w08 = 0;
    p->b0c = obj->f73;
    p->b0d = (unsigned char)kind;
    return p;
}
