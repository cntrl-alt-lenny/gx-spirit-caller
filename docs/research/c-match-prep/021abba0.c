/* CAMPAIGN-PREP candidate for func_021abba0 (ov008, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field-pack command record + submit call
 *   risk:       KNOWN 20v20 reg-alloc wall: orig binds (a0-2) to a fresh reg then derives the word; mwcc subtracts a0 in place -> permuter/.s
 *   confidence: low
 */
/* func_ov008_021abba0: build one 8-byte command record from (a0,a1) and submit
 * it. word0 = ((a1-2)&0xff) | 0x80000000 | (((a0-2)<<23)>>7); halfword@+4 =
 * 0x284. Then func_02005dac(2,0) supplies a handle and func_020944a4(buf,
 * handle, 8) commits. NOTE: ov008_core.h flags this a 20v20 REG-ALLOC near-
 * miss (orig puts a0-2 in a fresh reg + reuses; mwcc subtracts in place);
 * stable across operand orderings -> permuter/.s. */
#include "ov008_core.h"
extern int func_02005dac(int a, int b);
extern void func_020944a4(void *buf, int handle, int len);

void func_ov008_021abba0(int a0, int a1) {
    int buf[2];
    *(unsigned short *)((char *)buf + 4) = 0x284;
    buf[0] = ((a1 - 2) & 0xff) | 0x80000000 | (((a0 - 2) << 23) >> 7);
    func_020944a4(buf, func_02005dac(2, 0), 8);
}
