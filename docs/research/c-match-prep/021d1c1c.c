/* CAMPAIGN-PREP candidate for func_021d1c1c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store/dispatch order; RMW counter +=1 to reuse loaded 0; single 0x200 buf
 *   risk:       orig loads dead `ldrh [+0x6]` between cmp/bne; the C never reads +0x6 so that load vanishes (1 ldrh diverges). permuter-class / reshape-able only via a forced dummy read.
 *   confidence: low
 */
/* func_ov002_021d1c1c: ov002 one-shot (counter+0x810 gate) command builder.
 * On first entry (counter==0) it bumps the counter, then dispatches on the
 * +0x4 halfword id: range 0xa9..0xcb -> two stack buffers + cd88/cdb8/ae4a0;
 * id==0x8c -> 0202b100 + ce5c + ae484; else -> ae400. Always polls 021ae7a8
 * and clears +0x80c when it returns 0. cls D: store/dispatch order. */
#include "ov002_core.h"

extern char data_ov002_022ca9b4[];   /* opaque handle passed by ADDRESS to cdb8 */
extern char data_ov002_022cd73c[];   /* +4 -> ae400 first arg                  */

extern void func_ov002_0229cd88(void *self, unsigned int v);
extern void func_ov002_0229cdb8(void *self, unsigned int v);
extern void func_ov002_0229ce5c(void *dst, int a, int b);
extern void func_ov002_021ae4a0(void *buf, int n);
extern void func_ov002_021ae484(void *buf);
extern void func_ov002_021ae400(int a, int b);
extern int  func_0202b100(void);
extern int  func_ov002_021ae7a8(void);

int func_ov002_021d1c1c(void) {
    char buf[512];
    int id;
    id = *(unsigned short *)(data_ov002_022ce950 + 0x4);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
        if (id >= 0xa9 && id <= 0xcb) {
            func_ov002_0229cd88(buf + 0x100, (unsigned int)id);
            func_ov002_0229cdb8(buf + 0x100, (unsigned int)data_ov002_022ca9b4);
            func_ov002_0229cdb8(buf + 0x100, 0xcc);
            func_ov002_021ae4a0(buf + 0x100, 3);
        } else if (id == 0x8c) {
            func_ov002_0229ce5c(buf, id, func_0202b100());
            func_ov002_021ae484(buf);
        } else {
            func_ov002_021ae400(*(int *)(data_ov002_022cd73c + 0x4), id);
        }
    }
    if (func_ov002_021ae7a8() == 0)
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    return 0;
}
