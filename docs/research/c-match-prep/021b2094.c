/* CAMPAIGN-PREP candidate for func_021b2094 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     struct-field head; pointer-walk via next link; preload next before bl
 *   risk:       the +0x1400+0xea fold into one disp, and next held in a callee-saved reg across bl, may diff
 *   confidence: med
 */
/* func_ov002_021b2094: walk a linked chain whose head index is arg0->f0xa; for
 * each node call 021b1d84(idx); advance via next = *(u16*)(cf16c + idx*8 + 0x14ea).
 * next is loaded before the call (callee-saved across it). */

typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern void func_ov002_021b1d84(int idx);

struct Hdr2094 { char _pad[0xa]; u16 head; };

void func_ov002_021b2094(struct Hdr2094 *arg0) {
    int idx = arg0->head;
    int next;
    while (idx != 0) {
        next = *(u16 *)((char *)data_ov002_022cf16c + idx * 8 + 0x14ea);
        func_ov002_021b1d84(idx);
        idx = next;
    }
}
