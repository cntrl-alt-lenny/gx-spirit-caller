/* CAMPAIGN-PREP candidate for func_02087a08 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order first-used; bind arg0/arg2/base in callee-saved; ldrh<ldr => >= if-not-branch; mla idx*0x24 base
 *   risk:       First load r5=*arg0 is computed (cmp r5) but only consumed by the if(first); mwcc may fold the *arg0 read into the guard and reorder vs orig's eager ldr. permuter-class (scheduling/eager-load).
 *   confidence: low
 */
/* func_02087a08 (main, class C). mla struct-base + guard chain, multi-exit.
 * r4=arg0 held across; r5=*arg0 (first field); r6=&data_021a4cb4[arg1]
 * (stride 0x24, mla r6,r1,#0x24,base); r7=arg2 held across.
 *   if (*arg0) func_02087eb0(arg0);
 *   e = &data_021a4cb4[arg1];
 *   if (e->h8 < e->f18) { ... } else goto ins;
 *     n = func_0207cfdc(e, 0); if (!n) return 0;
 *     if (arg2 < n->b3d) return 0;
 *     func_02087790(e);
 * ins: q = func_0208771c(arg2); if (!q) return 0;
 *      func_02087824(e, q); *q = arg0; *arg0 = q; return q;
 */

struct E87a08 {
    unsigned short h8;        /* +0x08 */
    char _pad0a[0x18 - 0x0a];
    int            f18;       /* +0x18 */
};

struct N87a08 {
    char          _pad00[0x3d];
    unsigned char b3d;        /* +0x3d */
};

extern struct E87a08 data_021a4cb4[];
extern void  func_02087eb0(void *pp);
extern struct N87a08 *func_0207cfdc(struct E87a08 *e, void *cur);
extern void  func_02087790(struct E87a08 *e);
extern void  func_02087824(struct E87a08 *e, void *q);
extern void *func_0208771c(int a);

void *func_02087a08(void **arg0, int idx, int arg2) {
    void *first = *arg0;
    struct E87a08 *e = &data_021a4cb4[idx];
    void *q;

    if (first != 0) func_02087eb0(arg0);

    if (e->h8 >= e->f18) {
        struct N87a08 *n = func_0207cfdc(e, 0);
        if (n == 0) return 0;
        if (arg2 < n->b3d) return 0;
        func_02087790(e);
    }

    q = func_0208771c(arg2);
    if (q == 0) return 0;
    func_02087824(e, q);
    *(void **)q = arg0;
    *arg0 = q;
    return q;
}
