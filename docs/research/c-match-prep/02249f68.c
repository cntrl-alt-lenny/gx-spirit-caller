/* CAMPAIGN-PREP candidate for func_02249f68 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind per-player base in one local; D: :4/:2 bitfields, ldrh list walk in addr order
 *   risk:       Guard chain: orig branches each failed test to shared .L_b0; mwcc may inline some return-0 vs branch. Inline-vs-branch, permuter-class. Node/word bit boundaries struct-guessed.
 *   confidence: low
 */
/* func_ov002_02249f68: walk the node list whose head index is
 * data_ov002_022d0252[arg2], over data_ov002_022d0650 (8-byte nodes);
 * for each node whose f2&0xf < 6 and f0==0x12e5, resolve helper id via
 * 021b99b4(self,f4), require 021c33e4(self,self,id), require the 2-bit
 * field [16:15] of per-player word [base+0x418+id*4], then post
 * 02253458(self,14,id). cls D: :4 + :2 bitfields, ldrh list walk. */

typedef unsigned short u16;
typedef unsigned int   u32;

struct N02249f68 { u16 f0; u16 f2lo : 4; u16 : 12; u16 f4; u16 f6; };
struct W02249f68 { u32 : 15; u32 f15 : 2; u32 : 15; };

extern u16  data_ov002_022d0252[];   /* head-index table, indexed by arg2 */
extern char data_ov002_022cf16c[];   /* per-player row table, 0x868/player */
extern char data_ov002_022d0650[];   /* node table, 8-byte stride         */

extern int  func_ov002_021b99b4(int self, unsigned int f4);
extern int  func_ov002_021c33e4(int a, int b, int id);
extern int  func_ov002_02253458(int a, int b, int c);

void func_ov002_02249f68(int arg0, int arg1, int arg2) {
    char *base;
    struct N02249f68 *node;
    int idx;
    int id;
    idx = data_ov002_022d0252[arg2];
    if (idx == 0)
        return;
    base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    do {
        node = (struct N02249f68 *)(data_ov002_022d0650 + idx * 8);
        idx = node->f6;
        if (node->f2lo < 6 && node->f0 == 0x12e5) {
            id = func_ov002_021b99b4(arg0, node->f4);
            if (id >= 0 && func_ov002_021c33e4(arg0, arg0, id) != 0 &&
                ((struct W02249f68 *)(base + 0x418 + id * 4))->f15 != 0) {
                func_ov002_02253458(arg0, 14, id);
            }
        }
    } while (idx != 0);
}
