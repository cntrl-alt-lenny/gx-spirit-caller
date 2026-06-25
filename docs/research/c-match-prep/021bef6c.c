/* CAMPAIGN-PREP candidate for func_021bef6c (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind rec/base ptrs; mode==0||==3 guard; signed w/2 (asr after lsr#31 add); 2-stack-arg call
 *   risk:       reshape-able: x(r3) and e([sp]) must be declared/eval'd so both survive the func_02004f58 push; orig sets both in one branch. If eval order flips, x/e land in swapped slots — reorder decls.
 *   confidence: med
 */
/* func_ov006_021bef6c — text setup: fetch a record (021b6be0) and a layout
 * base (0208dd9c), set font mode from record[0], clear a slot, measure a width,
 * pick an x-origin (fixed 107 for mode 0/3, else 165 - width/2) and emit the
 * string, then reset the slot. ret 1. */
typedef unsigned char u8;
extern char data_ov006_0224f448[];
extern void func_02001d68(int mode);
extern void func_02001d98(void *buf, int a);
extern void func_02004f58(void *buf, void *str, void *base, int x, int e, int f);
extern int  func_02005554(void *g, int a, int b);
extern void *func_0208dd9c(void);
extern u8  *func_ov006_021b6be0(void *p, int a, int b);

typedef struct { char _pad0[0x40]; int mode; } Ov006TxtS;

int func_ov006_021bef6c(Ov006TxtS *self) {
    u8  *rec = func_ov006_021b6be0(data_ov006_0224f448, 2, 0);
    void *base = func_0208dd9c();
    int w;
    int x, e;
    func_02001d68(rec[0]);
    func_02001d98((char *)self + 4, 5);
    w = func_02005554(rec + 1, 0xc, 5);
    if (self->mode == 0 || self->mode == 3) {
        x = 0x6b;
        e = 3;
    } else {
        x = 0xa5 - (w / 2);
        e = 0xc;
    }
    func_02004f58((char *)self + 4, rec + 1, (char *)base + 0x40, x, e, 0xc);
    func_02001d98((char *)self + 4, -1);
    return 1;
}
