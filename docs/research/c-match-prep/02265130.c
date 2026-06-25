/* CAMPAIGN-PREP candidate for func_02265130 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel=6 then movne sel=7/5 via if-assign after each cmp; mul (a0&1)*0x868 index
 *   risk:       reshape-able: the discriminant uses cmp-then-movne where the cmp result of one call feeds the NEXT movne (sel updated after the bae7c call but the cmp is from b3ecc). mwcc must keep r0 cmp flags live across the bae7c arg-setup (rsb r0,#1;mov r1,#0x1800;mvn r2). If it doesn't, swap to explicit if before the call. unsigned cmp bls -> use unsigned t.
 *   confidence: med
 */
// func_ov002_02265130 — movne discriminant pick interleaved with calls
extern unsigned char data_ov002_022cf178[];
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021bae7c(int a, int b, int c);
extern int func_ov002_021bb068(int a);
extern void func_ov002_0226ae0c(int a, int b);

int func_ov002_02265130(int a0)
{
    int sel;
    int t;

    if (func_ov002_021bb068(0x1401) != 0)
        return 1;

    sel = 6;
    if (func_ov002_021b3ecc(a0, 0xb, 0x159f) != 0)
        sel = 7;

    if (func_ov002_021bae7c(1 - a0, 0x1800, -1) != 0)
        sel = 5;

    t = *(int *)((unsigned char *)data_ov002_022cf178 + (a0 & 1) * 0x868);
    if (t <= sel)
        return 1;

    func_ov002_0226ae0c(a0, t - sel);
    return 0;
}
