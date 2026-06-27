/* CAMPAIGN-PREP candidate for func_02210bf0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: repeated :1 reloads of self->off2; mla parity*0x868 table; 0/1 returns
 *   risk:       bind-vs-reload: orig RE-LOADS ldrh self->off2 before EACH guard (4x) rather than caching -- mwcc -O4 may CSE it into one ldr, collapsing 3 ldrh. reshape-able only if mwcc can be forced to reload (volatile-ish); likely permuter-class.
 *   confidence: low
 */
/* func_ov002_02210bf0 (ov002, cls D): multi-stage guard returning 0/1. self=r6,
 * r5=arg1, r4=arg2. Gate: (self->off2 :1)==r5 else 0. Then 021b9ecc(r5,r4);
 * 0202df78(_,0xfc9) must be !=0. Then 021bc8c8(self->off2:1, r5, r4)!=0. Then if
 * r5 != off2:1, check halfword data_022cf1a4[(r5&1)*0x868 + r4*0x14] !=0 (else 0).
 * Then 021bc618(); if 0: re-gate off2:1==r5, then 021bc288(r5,r4)!=0. Else ret 1.
 * LIT0=0xfc9, LIT1=0x868, LIT2=data_022cf1a4. */
struct E2 { unsigned short flag:1; };
extern unsigned short data_ov002_022cf1a4[];
extern int  func_0202df78(int a, int b);
extern int  func_ov002_021b9ecc(int a, int b);
extern int  func_ov002_021bc288(int a, int b);
extern int  func_ov002_021bc618(void);
extern int  func_ov002_021bc8c8(int a, int b, int c);
int func_ov002_02210bf0(char *self, int r5, int r4) {
    int f = ((struct E2 *)(self + 2))->flag;
    if (f != r5)
        return 0;
    func_ov002_021b9ecc(r5, r4);
    if (func_0202df78(0, 0xfc9) == 0)
        return 0;
    f = ((struct E2 *)(self + 2))->flag;
    if (func_ov002_021bc8c8(f, r5, r4) == 0)
        return 0;
    f = ((struct E2 *)(self + 2))->flag;
    if (r5 != f) {
        if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (r5 & 1) * 0x868 + r4 * 0x14) == 0)
            return 0;
    }
    if (func_ov002_021bc618() == 0) {
        f = ((struct E2 *)(self + 2))->flag;
        if (f != r5)
            return 0;
        if (func_ov002_021bc288(r5, r4) == 0)
            return 0;
    }
    return 1;
}
