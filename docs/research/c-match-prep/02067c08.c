/* CAMPAIGN-PREP candidate for func_02067c08 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     while-with-precheck; bind sub-object base (p+0x14) to a local
 *   risk:       the two-part && condition order/block layout, and whether sub stays in r4 vs reload; field offsets guessed; this is reg-alloc-walled (was shipped .s)
 *   confidence: low
 */
/* func_02067c08 — while-loop driving two helpers.
 * r5=p, r4 = p+0x14 (a sub-object base computed once). Loop:
 *   while (p->field_10 < p->field_4 && p->field_1c > 0) {
 *       r0 = func_020683ec(p+0x14); func_02068194(p, r0);
 *   }
 * The condition is checked first (b .L_88 entry), so it's a while not
 * do-while. p+0x14 is hoisted into a callee-saved reg (r4) across the
 * loop -> bind it to a local pointer.
 */
typedef struct Pool Pool;
struct Pool {
    char _pad_00[0x4];
    int  field_4;     /* +0x4  limit */
    char _pad_08[0x10 - 0x08];
    int  field_10;    /* +0x10 current */
    char _pad_14[0x1c - 0x14];
    int  field_1c;    /* +0x1c gate (>0) */
};

extern int  func_020683ec(void *sub);
extern void func_02068194(Pool *p, int item);

void func_02067c08(Pool *p) {
    void *sub = (char *)p + 0x14;
    while (p->field_10 < p->field_4 && p->field_1c > 0) {
        int item = func_020683ec(sub);
        func_02068194(p, item);
    }
}
