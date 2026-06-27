/* CAMPAIGN-PREP candidate for func_021d1b70 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield-insert struct (:8@12 -> lsl#24;lsr#12, :4@8 -> lsl#28;lsr#20, :8@0); per-branch field order matches asm; signed-char tables; bound base reg; range if-chain + mode switch
 *   risk:       permuter-class + struct-guessed: each branch does ONE ldr/2-inserts/ONE str; if mwcc does NOT coalesce the two consecutive bitfield writes (separate casts) it emits 2 RMW per branch. +0x284/+0x268/+0x264 offsets and field widths inferred from shifts, confirm vs real struct.
 *   confidence: low
 */
/* func_ov011_021d1b70 (cls D): resolve id -> code (signed-byte tables for the
 * 0x66/0x7d ranges, else 0201b690), stash id's byte into the +0x284 packed
 * word, then dispatch on the +0x264 mode and write the status/code nibbles. */
typedef unsigned char  u8;
typedef unsigned int   u32;
extern char data_ov011_021d403c[];
extern signed char data_ov011_021d3594[];
extern signed char data_ov011_021d35ac[];
extern int  func_0201b690(void);
extern void func_ov011_021cf048(void);
extern void func_ov011_021d191c(int id);
extern void func_ov011_021d1c80(int code);
extern void func_ov011_021d1ce8(void);

struct V284 { u32 f0 : 8; u32 f8 : 4; u32 f12 : 8; };
struct V268 { u32 : 5; u32 f5 : 4; };

void func_ov011_021d1b70(int id) {
    char *base = data_ov011_021d403c;
    int code;
    int mode;
    if (id >= 0x7d)
        code = data_ov011_021d3594[(id - 0x7d) * 6];
    else if (id >= 0x66)
        code = data_ov011_021d35ac[(id - 0x66) * 2];
    else
        code = func_0201b690();
    mode = *(int *)(base + 0x264);
    ((struct V284 *)(base + 0x284))->f12 = id;
    switch (mode) {
    case 0:
        func_ov011_021cf048();
        func_ov011_021d1c80(code);
        ((struct V284 *)(base + 0x284))->f8 = code;
        ((struct V284 *)(base + 0x284))->f0 = 4;
        break;
    case 1:
        if (code == ((struct V268 *)(base + 0x268))->f5) {
            func_ov011_021d191c(id);
            ((struct V284 *)(base + 0x284))->f0 = 7;
            ((struct V284 *)(base + 0x284))->f8 = code;
        } else {
            func_ov011_021d1ce8();
            ((struct V284 *)(base + 0x284))->f0 = 3;
            ((struct V284 *)(base + 0x284))->f8 = code;
        }
        break;
    }
}
