/* CAMPAIGN-PREP candidate for func_0229e5a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: packed :1/:5/:8/:1/:1 bitfield struct; per-field bic/orr inserts in store-order; uninit stack var
 *   risk:       orig reloads bf from [sp] before each field (ldrh;bic;orr;strh) - a bitfield member assign reproduces this. risk: mwcc may keep bf in a reg instead of stack-spilling each field. reshape-able
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229e5a0 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: pre-zero +0x2a; call; build packed
 * +0x28 bitfield in an (intentionally uninit) stack local via per-field
 * assigns in store-order; bit0=a1,[5:1]=a2,[13:6]=0,bit14=ret,bit15=0. */
extern int func_ov002_021c988c(int a, int b);

typedef struct {
    unsigned short b0   : 1;   /* bit0      */
    unsigned short b51  : 5;   /* bits[5:1] */
    unsigned short b136 : 8;   /* bits[13:6]*/
    unsigned short b14  : 1;   /* bit14     */
    unsigned short b15  : 1;   /* bit15     */
} Packed28;

void func_ov002_0229e5a0(char *self, unsigned short arg1, unsigned short arg2) {
    Packed28 bf;
    int ret;

    *(short *)(self + 0x2a) = 0;
    ret = func_ov002_021c988c(arg1, arg2);

    bf.b0  = arg1;
    bf.b51 = arg2;
    bf.b136 = 0;
    bf.b14 = ret;
    bf.b15 = 0;

    *(unsigned short *)(self + 0x28) = *(unsigned short *)&bf;
    *(char *)self = 0;
}
