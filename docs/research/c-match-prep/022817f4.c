/* CAMPAIGN-PREP candidate for func_022817f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two ptrs (slot for f30 reads, region for +0x38/+0x40); idx-first decl; movs lsrs from `!=0` guard; const-1 hoisted
 *   risk:       VERIFIED mwcc 2.0/sp1p5: reg-alloc EXACT (r4..r9), both f30 reloads + movs present, two-ptr increments match. Residual = same 2-insn zero-init order swap as 02281760. permuter-class.
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;
/* 0x14 sub-row: f30 :13 at +0; h8 = u16 at +0x8; w10 = word at +0x10 (bit8). */
struct slot { unsigned int f30 : 13; unsigned int _hi : 19; char _p4[4]; u16 h8; char _pa[6]; u32 w10; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b8fcc(int player, int idx);
extern int  func_ov002_022815a4(int id, int z);

int func_ov002_022817f4(int arg0) {
    int idx = 0;
    int count = 0;
    struct slot *sr = (struct slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x30);
    char *region = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    do {
        if (sr->f30 != 0) {
            if (idx >= 5 || func_ov002_021b8fcc(arg0, idx) != 0) {
                if (*(u16 *)(region + 0x38) != 0 || ((*(u32 *)(region + 0x40) >> 8) & 1)) {
                    if (func_ov002_022815a4(sr->f30, 1) != 0)
                        count++;
                }
            }
        }
        idx++;
        sr++;
        region += 0x14;
    } while (idx <= 10);
    return count;
}
