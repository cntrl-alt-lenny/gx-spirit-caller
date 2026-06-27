/* CAMPAIGN-PREP candidate for func_0207c934 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return before a call -> sub sp#4 frame + addne/ldmnefd/bxne predicated epilogue; reload ref
 *   risk:       orig RELOADS `ldr [r0,#0xc]` after the decrement-store before the !=0 test; if mwcc keeps the decremented value in a reg it skips the reload (1 ldr diff). reshape-able (write decrement and compare as two statements reading the field, as coded).
 *   confidence: high
 */
/* func_0207c934: refcount release guarded by a type/vtable tag.
 * r0=obj. obj->tag (+0x8) must equal &func_01ff8180, else no-op.
 * if (--obj->ref(+0xc) != 0) return;
 * obj->tag = 0; func_02091a0c();
 */
extern void func_01ff8180(void);
extern void func_02091a0c(void);

typedef struct {
    char  _pad[0x8];
    void *tag;   /* +0x8 */
    int   ref;   /* +0xc */
} obj_0207c934;

void func_0207c934(obj_0207c934 *obj) {
    if (obj->tag != (void *)func_01ff8180) return;
    obj->ref = obj->ref - 1;
    if (obj->ref != 0) return;
    obj->tag = 0;
    func_02091a0c();
}
