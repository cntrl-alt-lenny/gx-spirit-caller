/* CAMPAIGN-PREP candidate for func_021d4718 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     search loop: bool ternary + 2-iter scan (ptr-walk vs i*0x14 index) + sink + clear
 *   risk:       asm uses a walking ptr for cd3f4 but an i*0x14 mul for cd490; mwcc may strength-reduce both the same way (mul or walk), diverging
 *   confidence: low
 */
/* func_ov002_021d4718: scan two cd3f4 rows (stride 0x14) for one whose +0xa8
 * field equals the hi-bit flag; on a hit zero the matching cd490 row and stop.
 * Then post (0xf,0,0,0) and clear ce950+0x80c. */
#include "ov002_core.h"
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd490[];

void func_ov002_021d4718(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int i;
    for (i = 0; i < 2; i++) {
        if (flag == *(int *)(data_ov002_022cd3f4 + i * 0x14 + 0xa8)) {
            *(int *)(data_ov002_022cd490 + i * 0x14) = 0;
            break;
        }
    }
    func_ov002_0229ade0(0xf, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
