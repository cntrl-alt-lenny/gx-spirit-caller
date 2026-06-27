/* CAMPAIGN-PREP candidate for func_0205be60 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     exact store-order ([14] before refcount, [c]/[10] after [1c]); bind owner=*holder across alloc
 *   risk:       reshape-able: the unusual store interleave ([0x0c]/[0x10] emitted after [0x1c]) only matches if the C assignments stay in that source order; mwcc reordering struct stores would diverge. Owner offsets 0x20c/0x424 struct-guessed.
 *   confidence: med
 */
/* func_0205be60: allocate a 0x24 node, populate it, manage a refcount on
 * the owner, then push it onto owner[0x424] and return *out = node. r4 =
 * *holder (the owner) cached across the alloc. On alloc failure log+return 1.
 * STORE ORDER is load-bearing: [0],[4],[8],[14] then the refcount field
 * [18], then [1c],[c],[10],[20] (note [c]/[10] are written LATE, after
 * [1c]). When the first field (a==0) the node is a 'root' (refcount=1, no
 * owner bump); else node[0x18]=owner[0x20c]++ clamped to >=2. */

typedef struct Owner { char _pad[0x20c]; int refcount; char _pad2[0x424 - 0x210]; void *list; } Owner;
typedef struct Node {
    int   f00;   /* +0x00 a */
    int   f04;   /* +0x04 b */
    int   f08;   /* +0x08 s0 */
    int   f0c;   /* +0x0c s1 */
    int   f10;   /* +0x10 s2 */
    int   f14;   /* +0x14 = 0 */
    int   f18;   /* +0x18 refcount slot */
    int   f1c;   /* +0x1c = 0 */
    void *next;  /* +0x20 list link */
} Node;

extern void *func_020453e8(int size);
extern void  func_0205ffc0(void *holder, void *tag);
extern char  data_02100b08[];

int func_0205be60(void *holder, int a, int b, void **out, int s0, int s1, int s2) {
    Owner *owner = *(Owner **)holder;
    Node *n = (Node *)func_020453e8(0x24);

    if (n == 0) {
        func_0205ffc0(holder, data_02100b08);
        return 1;
    }
    n->f00 = a;
    n->f04 = b;
    n->f08 = s0;
    n->f14 = 0;
    if (a == 0) {
        n->f18 = 1;
    } else {
        int rc = owner->refcount;
        owner->refcount = rc + 1;
        n->f18 = rc;
        if (owner->refcount < 2) owner->refcount = 2;
    }
    n->f1c = 0;
    n->f0c = s1;
    n->f10 = s2;
    n->next = owner->list;
    owner->list = n;
    *out = n;
    return 0;
}
