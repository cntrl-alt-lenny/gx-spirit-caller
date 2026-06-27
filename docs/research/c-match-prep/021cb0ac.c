/* CAMPAIGN-PREP candidate for func_021cb0ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard via f_d0c then cd744[f_cec]==2 goto-tail; store-order d2c,d30,d0; double bic ~2,~1
 *   risk:       reshape-able: the two `bic #2`/`bic #1` must stay separate (orig does NOT fold to bic #3) and d2c-before-d30 store order — a `&= ~3` would collapse to one bic. The `.L_74` early-merge needs goto; if mwcc duplicates the tail the epilogue diverges. struct-guessed d016c offsets.
 *   confidence: med
 */
/* func_ov002_021cb0ac (ov002, class D, MED) — store-order RMW of globals.
 * Two guard tests (d016c.f_d0c, and a d016c.f_cec-indexed table==2) gate a
 * conditional 021b212c call; then unconditional d2c/d30 writes, clear two bits
 * of d016c.f_d0, two tail calls, clear ce950.f_80c. Store order preserved. */
typedef struct {
    char _a[0xd0]; unsigned int f_d0; char _b[0x18]; unsigned int f_cec;
    char _c[0x1c]; unsigned int f_d0c; char _d[0x1c]; int f_d2c; int f_d30;
} StateD016c;
extern StateD016c data_ov002_022d016c;
typedef struct { char _a[0x80c]; int f_80c; } StateCe950;
extern StateCe950 data_ov002_022ce950;
extern unsigned char data_ov002_022cd744[];   /* LIT2 table */
extern unsigned short data_ov002_022cf282[];  /* LIT4 per-parity u16 */
extern void func_ov002_021b212c(int a0, int a1, int a2);
extern void func_ov002_021b2ab4(void);
extern void func_ov002_0229ade0(int a0, int a1, int a2, int a3);

void func_ov002_021cb0ac(void) {
    unsigned short f2 = *(unsigned short *)((char *)&data_ov002_022ce950 + 0x2);
    if (data_ov002_022d016c.f_d0c != 0) {
        if (*(int *)(data_ov002_022cd744 + data_ov002_022d016c.f_cec * 4) == 2)
            goto tail;
    }
    if (f2 != 0) {
        int code = *(unsigned short *)((char *)data_ov002_022cf282
                   + (data_ov002_022d016c.f_cec & 1) * 0x868);
        func_ov002_021b212c(code, 0x11ed, 1);
    }
    data_ov002_022d016c.f_d2c = 0xc;
    data_ov002_022d016c.f_d30 = 0;
tail:
    data_ov002_022d016c.f_d0 &= ~2u;
    data_ov002_022d016c.f_d0 &= ~1u;
    func_ov002_021b2ab4();
    func_ov002_0229ade0(0x24, 0, 0, 0);
    data_ov002_022ce950.f_80c = 0;
}
