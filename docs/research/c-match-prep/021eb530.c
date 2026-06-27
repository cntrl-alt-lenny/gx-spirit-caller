/* CAMPAIGN-PREP candidate for func_021eb530 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl col/row20/field early; bind+reuse col across 3 tables; :13 bitfield
 *   risk:       orig holds (a&1)*0x868 in r6 and row*20 in r5 reused across 3 table reads via separate mul; if mwcc fails to CSE col it emits per-read mla and address insns diverge. reshape-able (keep col/row20 as named locals).
 *   confidence: med
 */
/* func_ov002_021eb530 (ov002, class C). Card/cell validation predicate.
 * args: r0=self, r1=a(col-parity src), r2=row.
 * (a&1)*0x868 (=col) and row*20 are HELD in regs and reused across cf16c/cf1a4/cf1ac
 * (asm uses two separate `mul`, not mla, precisely because col is reused).
 * field13 = subrow.f30 is bound to a callee-saved reg early and survives the b8fcc call. */

struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int  func_0202b878(int id);
extern int  func_ov002_021b8fcc(int a, int row);
extern int  func_ov002_021c1ef0(void *self, int a, int row);
extern int  func_ov002_021c2084(void *self, int a, int row, int flag);

int func_ov002_021eb530(void *self, int a, int row) {
    int col = (a & 1) * 0x868;
    int row20 = row * 20;
    struct subrow *sr = (struct subrow *)(data_ov002_022cf16c + col + row20);
    int field = sr->f30;
    if (row < 5) {
        if (func_ov002_021b8fcc(a, row) == 0)
            return 0;
    }
    if (field == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + col + row20) == 0)
        return 0;
    if (func_0202b878(field) != 0x17)
        return 0;
    if ((*(unsigned int *)(data_ov002_022cf1ac + col + row20) >> 9) & 1)
        return 0;
    if (func_ov002_021c1ef0(self, a, row) == 0)
        return 0;
    return func_ov002_021c2084(self, a, row, 1) != 0;
}
