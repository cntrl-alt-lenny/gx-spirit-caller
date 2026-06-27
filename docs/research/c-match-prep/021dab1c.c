/* CAMPAIGN-PREP candidate for func_021dab1c (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :3 bitfield (lsl;lsr not mask); bind base g; stride*0x20 ptr-arith; store-order kept
 *   risk:       reshape-able: data_02104f4c offsets struct-guessed (0xa3c/0xa64); if mwcc emits `and #7` not `lsl#29;lsr#29` the :3 field is wrong-typed (widen container/use signedness).
 *   confidence: med
 */
/* func_ov004_021dab1c: init/reset of the ov004 per-something state block.
 * Zeroes f9c/fa0, sets fb0=-1, gates on f8c>0x100; copies a 3-bit bitfield
 * (data_02104f4c.f_a3c, read lsl#29;lsr#29 => :3 field, NOT a mask) into
 * fc0, stores fbc, calls func_020aadf8(&g[0xc1], data_02105989), zeroes a
 * stride-0x20 array field (+0xb8) for i=1..4, then on f8c==0x200 latches two
 * sub-init results. g is held in r4 across all uses -> bind to ONE local. */

typedef unsigned char u8;

struct src_02104f4c {
    char          _pad0[0xa3c];
    unsigned char f_a3c : 3;   /* read as (b<<29)>>29 => 3-bit field */
    char          _pad1[0x27]; /* 0xa3d .. 0xa63 */
    int           f_a64;       /* 0xa64 */
};

extern char data_ov004_0220b500[];
extern struct src_02104f4c data_02104f4c;
extern char data_02105989[];

extern void func_020aadf8(char *dst, char *src);
extern int  func_ov004_021da978(void);
extern int  func_ov004_021daa48(void);

void func_ov004_021dab1c(void) {
    char *g;
    int   i;

    g = data_ov004_0220b500;
    *(int *)(g + 0x9c) = 0;
    *(int *)(g + 0xa0) = 0;
    *(int *)(g + 0xb0) = -1;
    if (*(int *)(g + 0x8c) <= 0x100)
        return;

    *(int *)(g + 0xb8) = 5;
    *(u8 *)(g + 0xc0) = (u8)data_02104f4c.f_a3c;
    *(int *)(g + 0xbc) = data_02104f4c.f_a64;
    func_020aadf8(g + 0xc1, data_02105989);

    for (i = 1; i < 5; i++)
        *(int *)(g + i * 0x20 + 0xb8) = 0;
    *(int *)(g + 0xa4) = 0;

    if (*(int *)(g + 0x8c) != 0x200)
        return;
    *(int *)(g + 0x9c) = func_ov004_021da978();
    *(int *)(g + 0xa0) = func_ov004_021daa48();
}
