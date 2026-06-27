/* CAMPAIGN-PREP candidate for func_020b044c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind r0->r5 r1->r4 (p,n swapped decl); strb len before the <0 test; signed cmps
 *   risk:       store-order: orig writes strb r4,[r5,#4] BEFORE 'cmp r0,#0' so the <0 early-return still stores len. If mwcc sinks the store past the branch, one strb diverges. reshape-able: place p->len=n before the if as written.
 *   confidence: med
 */
typedef unsigned char u8;

struct Num044c {
    u8 pad[4];
    u8 len;   /* 0x4 */
};

extern int func_020b0390(void);
extern void func_020b03fc(struct Num044c *p, int n);

extern void func_020b044c(struct Num044c *p, int n);

void func_020b044c(struct Num044c *p, int n) {
    if (n <= 0)
        return;
    if (n >= (int)p->len)
        return;
    if (func_020b0390() < 0) {
        p->len = (u8)n;
        return;
    }
    p->len = (u8)n;
    func_020b03fc(p, n);
}
