/* CAMPAIGN-PREP candidate for func_02087c34 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two stride loops; hoist constants 0x7f/1/0 into callee-saved (mov r6/r5/r4 before loop); store-order +0x20,+0x18,+0x1c
 *   risk:       Orig hoists loop-invariant constants (0x7f,1,0,0xc) and base ptrs into callee-saved regs BEFORE loop B; mwcc may rematerialize them inside the loop. reshape-able only partly; constant-hoist is permuter-class.
 *   confidence: low
 */
/* func_02087c34 (main, class C). Two init loops, struct-stride stores.
 * Loop A (16 iters, stride 0x44 over data_021a485c): zero +0x2c and +0x3c
 * (byte), call func_0207d12c(data_021a485c_base, elem). Loop B (32 iters,
 * stride 0x24 over data_021a4cb4): func_0207d1b8(elem,0xc),
 * func_0207d1b8(elem+0xc, i), store 0x7f@+0x20, 1@+0x18, 0@+0x1c.
 * Pre-loop: func_0207d1b8(data_021a4868,0x14); func_0207d1b8(data_021a485c,0x14).
 * Register hold order matters: r6=&A[i] base, r7=i, r4=data_021a485c reload.
 */

struct A87c34 { char _pad[0x44]; };  /* stride 0x44 */
struct B87c34 {                       /* stride 0x24 */
    char _pad00[0x18];
    int  f18;                         /* +0x18 */
    int  f1c;                         /* +0x1c */
    unsigned char b20;                /* +0x20 */
};

extern char data_021a4868[];
extern char data_021a485c[];
extern struct A87c34 data_021a4874[];
extern struct B87c34 data_021a4cb4[];
extern void func_0207d1b8(void *p, int n);
extern void func_0207d12c(void *base, void *elem);

void func_02087c34(void) {
    int i;
    char *a;
    struct B87c34 *b;

    func_0207d1b8(data_021a4868, 0x14);
    func_0207d1b8(data_021a485c, 0x14);

    a = (char *)data_021a4874;
    for (i = 0; i < 0x10; i++) {
        a[0x2c] = 0;
        a[0x3c] = 0;
        func_0207d12c(data_021a485c, a);
        a += 0x44;
    }

    b = data_021a4cb4;
    for (i = 0; i < 0x20; i++) {
        func_0207d1b8(b, 0xc);
        func_0207d1b8((char *)b + 0xc, i);
        b->b20 = 0x7f;
        b->f18 = 1;
        b->f1c = 0;
        b += 0x24 / 0x24;
    }
}
