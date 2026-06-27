/* CAMPAIGN-PREP candidate for func_02237114 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     parity index, coord unpack held across calls, &&-guard chain; tail (021d479c) RECONSTRUCTED
 *   risk:       struct-guessed + DATA DEFECT: batch asm is TRUNCATED (72 of ~80 instr; no .L_4e8 tail/epilogue/lit-pool). _LIT1/2 bases and the 021d479c tail are guessed; cannot byte-match until full .s is re-extracted.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02237114 (ov002, class D) — brief 494.
 * !!! INPUT ASM IS TRUNCATED: size=320 (~80 instr) but JSON carries only 72 and
 * lacks the shared .L_4e8 tail (3 branches target it) + epilogue + literal pool.
 * func_021d479c is declared extern yet UNREFERENCED in the visible body -> it is
 * the missing .L_4e8 tail call. _LIT0/1/2 reconstructed as 0x868 / cf17c / cf16c.
 * Below is a best-effort of the VISIBLE prefix; the tail is a reconstruction.
 * recipe: parity index p*0x868, coord unpack (coordX, Wlo=W&0x1fff) held in
 * regs across calls (bind), guard chain, packed return ((p?0x8000:0)|0x57). */
extern char data_ov002_022cf16c[];   /* _LIT2 guess: record +0x260 */
extern char data_ov002_022cf17c[];   /* _LIT1 guess: guard table   */
extern int  func_0202b878(int v);
extern int  func_0202b8c0(int v);
extern int  func_ov002_021c988c(int a, int b, int c, int d);
extern int  func_ov002_021ca5bc(int a);
extern int  func_ov002_021d479c(int a, int b, int c);   /* MISSING tail (.L_4e8) */
extern void func_ov002_021d87dc(int a);
extern void func_ov002_021e13f4(int a, int b, int c);
extern void func_ov002_021e276c(int a, int b, int c, int d);
extern void func_ov002_021e2818(int a);

struct Obj_114 { unsigned short h0; unsigned short b0 : 1; };
struct Rec_114 {
    unsigned int lo : 13;            /* W & 0x1fff  (Wlo) */
    unsigned int c13 : 1;
    unsigned int : 8;
    unsigned int c22 : 8;            /* (W>>22)&0xff */
};

int func_ov002_02237114(struct Obj_114 *o) {
    int p = o->b0 & 1;
    int t, coordX, Wlo, rv;
    unsigned int W;

    t = *(int *)((char *)data_ov002_022cf17c + p * 0x868);
    if (t == 0)
        return func_ov002_021d479c(0, 0, 0);   /* .L_4e8 (truncated) */

    W = *(unsigned int *)((char *)data_ov002_022cf16c + p * 0x868 + 0x260);
    coordX = (((struct Rec_114 *)&W)->c22 << 1) + ((struct Rec_114 *)&W)->c13;
    Wlo = ((struct Rec_114 *)&W)->lo;

    if (func_ov002_021c988c(p, 0xd, 0, coordX) == 0)
        func_ov002_021e2818(p);
    func_ov002_021d87dc(p);

    if (func_0202b878(Wlo) == 0x16 && func_0202b8c0(Wlo) == 0) {
        func_ov002_021e13f4(p, 1, 1);
        if (func_ov002_021ca5bc(coordX) != 0)
            func_ov002_021e276c(p, o->h0, 0x21, coordX & 0xffff);
        return func_ov002_021d479c(0, 0, 0);   /* .L_4e8 (truncated) */
    }
    /* .L_4b4 -> packs return value then flows into .L_4e8 (truncated) */
    rv = ((p ? 0x8000 : 0) | 0x57) & 0xffff;
    return func_ov002_021d479c(rv, coordX & 0xffff, coordX & 0xffff);
}
