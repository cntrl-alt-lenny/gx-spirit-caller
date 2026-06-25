/* CAMPAIGN-PREP candidate for func_021b27a4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     indexed head load; node-chain walk; :4 bitfield==const guard; preload next
 *   risk:       loop reg-alloc (idx/next/p) may flip; bitfield extract emits mov;mov (no flags) as needed
 *   confidence: med
 */
/* func_ov002_021b27a4: head = *(u16*)(d0252 + arg0*4); walk the d0650 node chain
 * (8-byte nodes, next at +6); when node->tag(:4 at +2)==3 call 021b1d84(idx).
 * next preloaded before the conditional call (callee-saved). */

typedef unsigned short u16;

extern char data_ov002_022d0252[];
extern char data_ov002_022d0650[];
extern void func_ov002_021b1d84(int idx);

struct LNode27 { u16 key0; u16 tag : 4; u16 _rest : 12; u16 key1; u16 next; };

void func_ov002_021b27a4(int arg0) {
    int idx = *(u16 *)(data_ov002_022d0252 + arg0 * 4);
    struct LNode27 *p;
    int next;
    while (idx != 0) {
        p = (struct LNode27 *)(data_ov002_022d0650 + idx * 8);
        next = p->next;
        if (p->tag == 3) {
            func_ov002_021b1d84(idx);
        }
        idx = next;
    }
}
