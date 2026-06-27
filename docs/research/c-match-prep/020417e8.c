/* CAMPAIGN-PREP candidate for func_020417e8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: select sign early; la(r4)/ls(r8) bound across 3rd aaddc; total = la+((ls-4)+l3)
 *   risk:       reshape-able: sum assoc — orig forms ((r8-4)+l3) then r4+that. If mwcc reassociates to la+ls-4+l3 the add chain/regs reorder. Force nesting via parens + temp.
 *   confidence: med
 */
/* func_020417e8 - main - class C
 * struct-base offsets, decl-order; r6 = sign-string selected by base[0x8]
 * r7=self; r5=self+0x19f4 (Buf); r4/r8 hold two strlen results across a 3rd
 */
extern unsigned char data_020fe904[];
extern unsigned char data_020fe958[];
extern int func_020414b0(int self, void *buf, int total);
extern int func_0209150c(int dst, int cap, void *fmt, int a, int b); /* stack arg + 2 reg */
extern int func_020aaddc(void *s);  /* strlen-like */

typedef struct {
    int _0;
    int off;   /* +0x4 */
    int _8;
    int cap;   /* +0xc */
} Buf;

int func_020417e8(int self)
{
    Buf *b;
    unsigned char *sign;
    int la;
    int ls;
    int total;

    if (*(int *)(self + 0x1008) == 0)
        sign = data_020fe904;
    else
        sign = data_020fe958;
    b = (Buf *)(self + 0x19f4);
    la = func_020aaddc((void *)*(int *)(self + 0x1124));
    ls = func_020aaddc(sign);
    total = la + ((ls - 4) + func_020aaddc((void *)*(int *)(self + 0x1128)));
    if (func_020414b0(self, (void *)(self + 0x19f4), total + 0x400) != 1)
        return 1;
    b->off = b->off + func_0209150c(b->off, b->cap, sign,
                                    *(int *)(self + 0x1124),
                                    *(int *)(self + 0x1128));
    return 0;
}
