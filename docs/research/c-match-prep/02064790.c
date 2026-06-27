/* CAMPAIGN-PREP candidate for func_02064790 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     home args on stack; arg0 address-taken so reloaded [sp,#0x10] each loop; void return; counted do-while
 *   risk:       reshape-able: orig RELOADS self from [sp,#0x10] inside the loop (self->field_8->field_10). Because &self is passed to func_020544c8, mwcc must spill self; if it keeps self in a reg the in-loop ldr pair diverges. Keep &self use.
 *   confidence: low
 */
// func_02064790 — main, cls C (counted search loop, list scan)
// stmdb {r0,r1,r2,r3} = home incoming args; arg0 reloaded via [sp,#0x10].
// Fallback passes &arg0 (add r1, sp, #0x10) -> arg0 address taken => stays on stack.
// No consistent r0 set on returns => void.
typedef struct A A;
struct A {
    char _8[8];
    void *field_8;   // [+0x08]
    int field_c;     // [+0x0c]
    char _10[4];
    int field_14;    // [+0x14]
    char _18[0xc];
    int field_24;    // [+0x24]
};
struct Inner {
    char _c[0xc];
    int field_c;     // [+0x0c]
    int field_10;    // [+0x10]
};
extern void func_02053e58(int list, int i);
extern int  func_02054140(int list);
extern int *func_020540d0(int list, int i);
extern void func_020544c8(int x, A **pself);
extern void func_02064790(A *self, int b, int c, int d);

extern void func_02064790(A *self, int b, int c, int d) {
    struct Inner *in;
    if (self->field_14 != 0)
        return;
    if (self->field_24 != 0)
        return;
    if (self->field_c != 7) {
        in = (struct Inner *)self->field_8;
        func_020544c8(in->field_c, &self);
        return;
    }
    {
        struct Inner *in0 = (struct Inner *)self->field_8;
        int n = func_02054140(in0->field_10);
        int i = 0;
        if (n <= 0)
            return;
        do {
            struct Inner *e = (struct Inner *)self->field_8;
            int *p = func_020540d0(e->field_10, i);
            if (p[0] == (int)self) {
                func_02053e58(e->field_10, i);
                return;
            }
        } while (++i < n);
    }
}
