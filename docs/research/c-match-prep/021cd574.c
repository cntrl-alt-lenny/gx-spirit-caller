/* CAMPAIGN-PREP candidate for func_021cd574 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: rsb for const-minus-load; bitfield guard (x<<23)>>28; stacked struct by &; preserve store order x then y.
 *   risk:       permuter-class: orig materialises arg1=-1 as sub r1,r0,#8 / sub r1,r0,#7 (reuse of live first-arg reg); mwcc will likely emit mvn r1,#0 instead -> 2 diverging instrs no reshape fixes.
 *   confidence: med
 */
/* func_ov011_021cd574 (ov011, class D): guarded twin calls that build a stacked
 * {x,y} struct and pass it by address with seven stack args.
 *   if (((*(u32*)(021d4000+0x2a4))>>5 & 0xf) != 2) return;    [lsl#17/lsr#1c]
 *   flags = func_0201b770();
 *   s.x = 0x56000  - *(int*)(021d403c+0x1fc);
 *   s.y = 0x14c000 - *(int*)(021d403c+0x200);
 *   if (flags & 0x2000) func_ov011_021cd0dc(7, -1, 2, 0x1b, &s, 0, 0, 0);
 *   if (flags & 0x4000) func_ov011_021cd0dc(6, -1, 2, 0x1b, &s, 0, 0, 0);
 * The two -1 args appear in the orig as sub r1,r0,#8 / sub r1,r0,#7 (deriving
 * -1 from the live first-arg reg) -- a constant-materialisation choice. */
extern int func_0201b770(void);
extern void func_ov011_021cd0dc(int a, int b, int c, int d, void *p,
                                int e, int f, int g);
extern unsigned char data_ov011_021d4000[];
extern unsigned char data_ov011_021d403c[];

struct Pt { int x; int y; };

void func_ov011_021cd574(void) {
    struct Pt s;
    int flags;

    if ((((*(unsigned int *)(data_ov011_021d4000 + 0x2a4)) << 23) >> 28) != 2)
        return;

    flags = func_0201b770();
    s.x = 0x56000  - *(int *)(data_ov011_021d403c + 0x1fc);
    s.y = 0x14c000 - *(int *)(data_ov011_021d403c + 0x200);

    if (flags & 0x2000)
        func_ov011_021cd0dc(7, -1, 2, 0x1b, &s, 0, 0, 0);
    if (flags & 0x4000)
        func_ov011_021cd0dc(6, -1, 2, 0x1b, &s, 0, 0, 0);
}
