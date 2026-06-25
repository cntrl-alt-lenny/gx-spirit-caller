/* CAMPAIGN-PREP candidate for func_021d4ba8 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     changed-bool prologue; bind b500 base for repeated unk88 reads; :3-bitfield extract; if-chain order matches
 *   risk:       permuter-class: changed-bool reuses dead unk38 reg r0 for c, mwcc picks fresh r1 (flagged ov004 wall); ALSO data_02104f4c[0xa3c] :3 extract needs a real :3 bitfield struct to emit lsl#29;lsr#29 not 'and' (struct-guessed).
 *   confidence: low
 */
/* func_ov004_021d4ba8: changed-bool gated init then a state-select guard chain
 * over data_ov004_0220b500.unk88. On enter (rec.38 latch) push a :3 setting byte
 * + a 0x1c block; three early guards set unk30 phases; then drive 021d7c00/54 and
 * fan out on b500.unk88 (1/2/3) to phase constants. */
#include "ov004_core.h"
extern char data_02104f4c[];
extern char data_02105989[];
extern char data_021040ac[];
extern char *func_0203268c(void);
extern int  func_02033654(void *ctx);
extern void func_02049684(void *buf, int n, ...);
extern void func_020aadf8(void *dst, void *src);
extern void func_ov004_021c9d8c(int x);
extern int  func_ov004_021c9d9c(void);
extern void func_ov004_021d7c00(int x);
extern int  func_ov004_021d7c54(void);

void func_ov004_021d4ba8(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        char buf[0x1c];
        buf[0] = (unsigned char)((data_02104f4c[0xa3c] << 29) >> 29); /* :3 extract */
        func_020aadf8(buf + 1, data_02105989);
        *(int *)(buf + 0x18) = *(int *)(data_02104f4c + 0xa64);
        func_02049684(buf, 0x1c);
        if (*(int *)(data_ov004_0220b500 + 0x48) == 0) {
            *(int *)(p + 0x30) = 0x1d; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
            return;
        }
        if (func_ov004_021c9d9c() != 0) {
            *(int *)(p + 0x30) = 0x21; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
            return;
        }
        if (*(int *)(data_021040ac + 0xbac) >= 0) {
            *(int *)(p + 0x30) = 0x20; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
            return;
        }
        func_ov004_021d7c00(1);
    }
    if (func_ov004_021d7c54() == 0) return;
    {
        char *b = data_ov004_0220b500;
        if (*(int *)(b + 0x88) == 1) {
            *(int *)(p + 0x30) = 0x1b; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
        }
        if (*(int *)(b + 0x88) == 2) {
            if (func_02033654(func_0203268c()) > 0) {
                *(int *)(p + 0x30) = 0x1d; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
                func_ov004_021c9d8c(0);
            } else {
                *(int *)(p + 0x30) = 0x19; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
            }
        } else if (*(int *)(b + 0x88) == 3) {
            *(int *)(p + 0x30) = 0x25; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
        }
        if (*(int *)(b + 0x88) >= 0) return;
        *(int *)(p + 0x30) = 0x24; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
    }
}
