/* CAMPAIGN-PREP candidate for func_02281760 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two parallel ptrs (region + slot=region+0x30); idx-before-count decl-order; :13 bitfield reload across call
 *   risk:       VERIFIED mwcc 2.0/sp1p5: reg-alloc EXACT (r4..r9,sl all match), reload kept. Residual = 2-insn zero-init: orig mov r5(count),#0 then mov r4(idx),r5; mwcc emits the reverse. permuter-class (mov-order anneal).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;
/* 0x14-byte sub-row: f30 = low-13 bitfield at +0 (lsl#19;lsr#19);
 * w10 = word at +0x10, bit8 is the active flag. */
struct slot { unsigned int f30 : 13; unsigned int _hi : 19; char _p4[0xc]; u32 w10; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_022575c8(int self, int x, int idx);
extern int  func_ov002_022815a4(int id, int z);

int func_ov002_02281760(int arg0, int arg1) {
    int idx = 0;
    int count = 0;
    char *region = data_ov002_022cf16c + (arg1 & 1) * 0x868;
    struct slot *sr = (struct slot *)(region + 0x30);
    do {
        if ((*(u32 *)(region + 0x40) >> 8) & 1) {
            if (func_ov002_022575c8(arg0, arg1, idx) != 0) {
                if (func_ov002_022815a4(sr->f30, 0) != 0)
                    count++;
            }
        }
        idx++;
        region += 0x14;
        sr++;
    } while (idx <= 4);
    return count;
}
