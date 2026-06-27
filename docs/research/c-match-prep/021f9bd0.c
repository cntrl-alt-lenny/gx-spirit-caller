/* CAMPAIGN-PREP candidate for func_021f9bd0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: signed lsl31/lsr31 -> (flag<<31)>>31; mul-index plain *0x868; cond-store via if; bind base each use to reload
 *   risk:       orig RELOADS data_022ce288 (_LIT0) at every 0x5b4 access (3 ldr); if mwcc binds it to one reg, the ldr pattern + reg-alloc diverge. reshape-able (re-read global each use, don't bind).
 *   confidence: med
 */
// func_ov002_021f9bd0 - step switch on global state, mul-indexed table, cond store tail

typedef struct EntA EntA;

extern unsigned char data_ov002_022ce288[];   // global block; state byte at +0x5b4
extern unsigned char data_ov002_022cf178[];   // table indexed by k*0x868

extern void func_ov002_021e2b3c(void);
extern int  func_ov002_021d7a1c(EntA *a, int b);
extern void func_ov002_021e2c5c(void);

struct EntA {
    unsigned short h0;       // +0x0
    unsigned short flag;     // +0x2  (bit0 used)
    unsigned char  pad4[8];  // +0x4
    unsigned short hC;       // +0xc
};

int func_ov002_021f9bd0(EntA *r5, EntA *r4)
{
    int state = *(int *)(data_ov002_022ce288 + 0x5b4);
    if (state == 0) {
        func_ov002_021e2b3c();
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    }
    if (state == 1) {
        unsigned int idx = (r5->flag << 31) >> 31;     // (flag & 1)
        if (*(int *)(data_ov002_022cf178 + (idx & 1) * 0x868) != 0) {
            func_ov002_021d7a1c(r5, 0);
            return 0;
        }
        func_ov002_021e2c5c();
        if (r4->h0 == 0x14e0)
            r5->hC = r4->hC;
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    }
    return 1;
}
