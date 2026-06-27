/* CAMPAIGN-PREP candidate for func_021ce3a4 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: guard chains with (x<<k)>>k bitfield extracts; cmpeq short-circuit; masked-field RMW stores; preserve order.
 *   risk:       struct-guessed: asm TRUNCATED at shared exit .L_17c (reconstructed as return 0) and _LIT2 mask assumed 0xffe01fff; also several guard cmps use shifted-operand byte extracts that may fold to and;cmp.
 *   confidence: low
 */
/* func_ov011_021ce3a4 (ov011, class D): two-way dispatch on g4000[0x2a0] with
 * nibble/byte bitfield guard chains and masked-field stores.
 * NOTE: source asm is TRUNCATED at .L_17c (the shared exit). That label is the
 * fall-through / "no-op" path for every failed guard and every `b .L_17c`; the
 * two explicit returns are `return 1`, so .L_17c is reconstructed as return 0.
 * _LIT2 (the and-mask before orr #0xc000) is not in the truncated pool; taken as
 * 0xffe01fff by analogy with func_ov011_021ce344 (bits 13..20 cleared).
 *
 * case 0 (g2a0==0): require f=((g268>>5)&0xf)!=0, f==(g280&0xff),
 *   and (if f!=((g268>>9)&0xf)) call ccfcc; then clear g288, call ce344,
 *   set g260 |= 0x100000, return 1.
 * case 1 (g2a0==1): require (g240&7)==3 && g238==0 && g23c==0 &&
 *   ((g25c>>15)&0xff)==((g258>>10)&0xff); set g274 field 0xc000; if !cdb7c()
 *   call cad00((g258>>10)&0xff); if cdb7c() call ceffc()+ccfcc(); finally
 *   g260 = (g260 & ~0xf0000) | ((func_020139b4()&0xf)<<16) | 0x100000; ret 1. */
extern int  func_020139b4(void);
extern void func_ov011_021ccfcc(void);
extern void func_ov011_021ce344(void);
extern void func_ov011_021ceffc(void);
extern void func_ov011_021cad00(int v);
extern int  func_ov011_021cdb7c(void);
extern unsigned char data_ov011_021d4000[];
extern unsigned char data_ov011_021d403c[];

int func_ov011_021ce3a4(void) {
    unsigned char *g = data_ov011_021d403c;
    unsigned int sel = *(unsigned int *)(data_ov011_021d4000 + 0x2a0);
    unsigned int x;
    unsigned int f;
    unsigned int *p;

    if (sel == 0) {
        x = *(unsigned int *)(g + 0x268);
        f = (x << 23) >> 28;
        if (f == 0)
            return 0;
        if (f != ((*(unsigned int *)(g + 0x280) << 24) >> 24))
            return 0;
        if (f != ((x << 19) >> 28))
            func_ov011_021ccfcc();
        *(int *)(g + 0x288) = 0;
        func_ov011_021ce344();
        p = (unsigned int *)(g + 0x260);
        *p |= 0x100000;
        return 1;
    }

    if (sel == 1) {
        if (((*(unsigned int *)(g + 0x240) << 29) >> 29) != 3)
            return 0;
        if (*(int *)(g + 0x238) != 0 || *(int *)(g + 0x23c) != 0)
            return 0;
        if (((*(unsigned int *)(g + 0x25c) << 9) >> 24) !=
            ((*(unsigned int *)(g + 0x258) << 14) >> 24))
            return 0;

        p = (unsigned int *)(g + 0x274);
        *p = (*p & 0xffe01fffu) | 0xc000;

        if (func_ov011_021cdb7c() == 0)
            func_ov011_021cad00((int)((*(unsigned int *)(g + 0x258) << 14) >> 24));
        if (func_ov011_021cdb7c() != 0) {
            func_ov011_021ceffc();
            func_ov011_021ccfcc();
        }

        p = (unsigned int *)(g + 0x260);
        *p = (*p & ~0xf0000u) | (((unsigned int)func_020139b4() & 0xf) << 16)
             | 0x100000;
        return 1;
    }

    return 0;
}
