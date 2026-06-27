/* CAMPAIGN-PREP candidate for func_02252014 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 id; RELOAD word for unpack; ce288+0x5d4 count, +0x5dc byte==0x19, parallel ce884[i] bitfields (>>9)&1 / &0x1ff; do/while; kind 11
 *   risk:       orig walks two pointers in lockstep (r0+=1 for the 0x5dc byte, r7+=4 for ce884) and indexes ce884[i] TWICE; mwcc may strength-reduce to one induction var or reload differently, and ce288/ce884 offsets are struct-guessed from asm. permuter-class (loop reg-alloc + induction)
 *   confidence: low
 */
/* func_ov002_02252014 (ov002, class D, MED) — guard-chain then a parallel-array
 * inner scan. id (:13) at row+0x120+arg2*4; gates func_0202e234, func_ov002_021ca440.
 * Then unpack = ((v>>22)&0xff)<<1 + (v>>13)&1 (reloaded). Scan i<*(int*)(ce288+0x5d4):
 * if *(u8*)(ce288+0x5dc+i)==0x19 && player==((ce884[i]>>9)&1) && unpack==(ce884[i]&0x1ff)
 * post kind 11 and stop. */
#include "ov002_core.h"
extern int func_0202e234(int id);
extern int func_ov002_021ca440(int player, int id);
extern int data_ov002_022ce884[];
void func_ov002_02252014(int player, int arg1, int arg2) {
    char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x120;
    unsigned int v;
    int id = ((struct Ov002Slot *)(row + arg2 * 4))->id;
    int i;
    int unpack;
    int count;
    if (func_0202e234(id) == 0)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    v = *(unsigned int *)(row + arg2 * 4);
    unpack = (int)(((v >> 22) & 0xff) << 1) + (int)((v >> 13) & 1);
    count = *(int *)(data_ov002_022ce288 + 0x5d4);
    if (count == 0)
        return;
    i = 0;
    do {
        if (*(u8 *)(data_ov002_022ce288 + 0x5dc + i) == 0x19 &&
            player == (int)((data_ov002_022ce884[i] >> 9) & 1) &&
            unpack == (data_ov002_022ce884[i] & 0x1ff)) {
            func_ov002_02253458(player, 0xb, arg2);
            return;
        }
        i++;
    } while (i < count);
}
