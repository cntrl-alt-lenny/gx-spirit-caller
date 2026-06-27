/* CAMPAIGN-PREP candidate for func_021d71e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     asymmetric shifts force lsl#18;lsr#31 / lsl#2;lsr#24; sel ternary; (u16) packs
 *   risk:       permuter-class: orig RELOADS *p twice (ldr r1,[r0]; ldr r0,[r0]) for the two shift chains; mwcc -O4 will CSE the identical *p into ONE ldr (no aliasing barrier), a 1-load near-miss C cannot force apart.
 *   confidence: med
 */
/* func_ov002_021d71e0 (ov002, cls D): resolve a record (021c93f0 kind 0xb),
 * extract bit13 + 8-bit field (bits22..29) of its first word, then arg-pack
 * kind 0x16/0x1a into 021d479c. The orig RELOADS *ptr twice (ldr r1,[r0];
 * ldr r0,[r0]) -- read the word twice, do not bind to one local. */
#include "ov002_core.h"

extern int *func_ov002_021c93f0(int a, int b, int c, int d);
extern void func_ov002_021d479c(int packed, int a, int b, int c);
extern void func_ov002_02244fe4(int a, int b);

void func_ov002_021d71e0(int arg0, int arg1, int arg2) {
    int *p = func_ov002_021c93f0(arg0, 0xb, arg1, arg2);
    int bit13 = (unsigned int)(*p << 18) >> 31;
    int fld   = ((unsigned int)(*p << 2) >> 24) << 1;
    int composite = bit13 + fld;
    int sel = (arg2 == 0) ? 1 : 0;
    func_ov002_021d479c(0x3f,
                        (u16)(((arg0 & 1) | 0x16) | ((unsigned int)(composite << 22) >> 16)),
                        (u16)((bit13 | 0x1a) | (sel << 6)),
                        0);
    func_ov002_02244fe4(0x24, 0);
}
