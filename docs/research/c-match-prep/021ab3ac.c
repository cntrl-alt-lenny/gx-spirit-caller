/* CAMPAIGN-PREP candidate for func_021ab3ac (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     16-byte ldm/stm via 4-elem array copy; store-order of stack args = asm sequence; bind r4=base across
 *   risk:       struct-guessed + reshape-able: ldmia/stmia 4-word copy should match if blk is a 4-int local; but stack-arg push order (sp,#0..#0x14) is rigid — mwcc may interleave the stores differently, fixable by reordering the call's literal args.
 *   confidence: med
 */
/* func_ov008_021ab3ac: copy two 16-byte blobs to stack, then two
   identical-shape calls. cls C (struct-copy / store-order). */

extern unsigned int data_ov008_021b23c0[4]; /* _LIT0 */
extern unsigned int data_ov008_021b23d0[4]; /* _LIT1 */
extern int data_ov008_021b2d34;             /* _LIT2 base */
extern int data_ov008_021b2d74;             /* _LIT3 base */

extern void func_0201e7e0(void);
extern void func_0201ef90(int *p0, int *p1, int *p2, int mode,
                          int a4, int a5, int *blk, int a7, int a8, int a9);

typedef struct {
    int  f0;   /* +0x0 */
    int  f4;   /* +0x4 */
    int  f8;   /* +0x8 */
    char _pad[0x38 - 0xc];
    int  f38;  /* +0x38 */
} Gfx_021ab3ac;

void func_ov008_021ab3ac(void)
{
    unsigned int blkA[4];
    unsigned int blkB[4];
    Gfx_021ab3ac *g;

    blkA[0] = data_ov008_021b23c0[0];
    blkA[1] = data_ov008_021b23c0[1];
    blkA[2] = data_ov008_021b23c0[2];
    blkA[3] = data_ov008_021b23c0[3];
    blkB[0] = data_ov008_021b23d0[0];
    blkB[1] = data_ov008_021b23d0[1];
    blkB[2] = data_ov008_021b23d0[2];
    blkB[3] = data_ov008_021b23d0[3];

    g = (Gfx_021ab3ac *)&data_ov008_021b2d34;
    func_0201e7e0();
    func_0201ef90(&g->f0, &g->f4, &g->f8, 0x100,
                  0x2, 0x400, blkA, 1, 0x200, g->f38);

    g = (Gfx_021ab3ac *)&data_ov008_021b2d74;
    func_0201e7e0();
    func_0201ef90(&g->f0, &g->f4, &g->f8, 0xf900,
                  0x2, 0x40, blkB, 0, 0x20, g->f38);
}
