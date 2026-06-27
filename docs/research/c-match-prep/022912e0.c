/* CAMPAIGN-PREP candidate for func_022912e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload f2 :1 each use; j=1-parity stack index; (j&1)*0x159b table; adds==0 test
 *   risk:       struct-guessed: _LIT0 0x159b passed as arg vs index — and data_022cf16c here is indexed by (j&1)*0x159b not 0x868. permuter-class: r4 holds parity across 021c3ae4/021ba6cc calls (caller-saved reload coin-flip).
 *   confidence: low
 */
// func_ov002_022912e0 — ov002 class D: bitfield + stack-index + mul-table, guard chain
#include <stddef.h>

struct Hdr { unsigned short f0; unsigned short f2; }; // :1 field at +2

extern unsigned char data_ov002_022cf16c[]; // base, [r2 = parity*0x159b? *0x868]
extern int func_ov002_021ba6cc(struct Hdr *h, int sel);
extern int func_ov002_021bae7c(int parity, int a1, int a2);
extern int func_ov002_021c3ae4(struct Hdr *h, int sel);
extern void func_ov002_0220eb00(struct Hdr *h, int *out);

int func_ov002_022912e0(struct Hdr *h)
{
    int buf[2];
    int parity = (h->f2 << 0x1f) >> 0x1f;       // :1 field
    if (func_ov002_021bae7c(parity, 0x159b, -1)) return 1;
    func_ov002_0220eb00(h, buf);
    {
        int p = (h->f2 << 0x1f) >> 0x1f;        // reload f2, :1
        int j = 1 - p;                           // rsb r1, r4, #1
        int thr = buf[j];
        if (thr == 0) return 0;
        {
            unsigned int off = (j & 1) * 0x159b;
            int cap = *(int *)(data_ov002_022cf16c + off);
            if (cap <= thr) return 1;
        }
        if (func_ov002_021c3ae4(h, 0x159b) + func_ov002_021ba6cc(h, 0x159b) == 0) return 1;
        return 0;
    }
}
