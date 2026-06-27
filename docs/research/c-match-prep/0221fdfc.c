/* CAMPAIGN-PREP candidate for func_0221fdfc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on ce288+0x5a8; bit0 :1; two-record asymmetric bitfield pack; if-assign return path
 *   risk:       Case 0x80 reloads f2 after the 0225368c call (orig ldrh again pre-bne) - if mwcc keeps b0 live, one ldrh diverges; and the *a/*b read order (w=*b first) must hold. reshape-able: reload via fresh self->b0 read / decl order of v,w.
 *   confidence: med
 */
/* func_ov002_0221fdfc: ov002 state dispatch + bitfield extract/pack (cls D).
 * State at ce288+0x5a8 -> 0x7d-0x80 table. Case 0x7f loads two records via two
 * 021afb74 calls and packs bitfields from each into one arg (asymmetric
 * shifts). self in r0->r4. */
typedef unsigned int   u32;
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern int  func_ov002_021ae400(int a, int b);
extern int  func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int  func_ov002_021e1870(int a, int b, int c);
extern int  func_ov002_021e286c(int a);
extern int  func_ov002_02244fe4(int a, int b);
extern int  func_ov002_0225368c(int a, int b, int c);
extern int  func_ov002_0226b054(int a);
int func_ov002_0221fdfc(struct Self *self) {
    int *a, *b, v, w;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_0225368c(self->b0, self->f0, 0) == 0) {
            func_ov002_021ae400(self->b0, 0xd);
            return 0x7e;
        }
        func_ov002_021af9d0(self->b0, 6, self->f0, 0);
        return 0x7f;
    case 0x7f:
        a = func_ov002_021afb74();
        b = func_ov002_021afb74();
        w = *b;
        v = *a;
        func_ov002_021e1870(self->b0,
            (((u32)(w << 2) >> 24) << 1) + ((u32)(v << 18) >> 31), 0);
        return 0x7d;
    case 0x7e:
        func_ov002_0226b054(1 - self->b0);
        return 0x7d;
    case 0x7d:
        func_ov002_021e286c(self->b0);
        func_ov002_02244fe4(0x24, 0);
        return 0;
    }
    return 0;
}
