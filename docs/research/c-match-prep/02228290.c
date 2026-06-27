/* CAMPAIGN-PREP candidate for func_02228290 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer i in r9 declared first; par=eor reused; mla base=(par&1)*0x868+data; inner sl+=0x14; movs;beq
 *   risk:       mla sl,r0,r4,r6 keeps base in sl and adds 0x14/iter; if mwcc recomputes base+j*0x14 instead of strength-reducing, the mla/add pattern diverges — permuter-class (loop reg-alloc / IV).
 *   confidence: med
 */
// func_ov002_02228290 — ov002 EUR, class C
// nested 2x11 loop, eor parity selects base (idx&1)*0x868, calls per slot

extern int func_ov002_021b9e00(int, int);
extern int func_ov002_021d91e0(int, int, int);
extern unsigned char data_ov002_022cf16c[];
extern int data_ov002_022d016c[];   // [0xcec/4] read each outer iter

int func_ov002_02228290(void)
{
    int i, j, par;
    unsigned char *base;

    for (i = 0; i < 2; i++) {
        par = data_ov002_022d016c[0xcec / 4] ^ i;
        base = data_ov002_022cf16c + (par & 1) * 0x868;
        for (j = 0; j <= 10; j++) {
            int r;
            if (*(unsigned short *)(base + j * 0x14 + 0x38) == 0)
                continue;
            r = func_ov002_021b9e00(par, j);
            if (r == 0)
                continue;
            func_ov002_021d91e0(par, j, -r);
        }
    }
    return 0;
}
