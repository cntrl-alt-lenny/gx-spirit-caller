/* CAMPAIGN-PREP candidate for func_021b3c10 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     node-chain search; unsigned :4 bitfield < const; && short-circuit; return node ptr
 *   risk:       return-of-address loop is codegen-sensitive (induction/CSE); next-into-r0 ordering may need a permuter nudge
 *   confidence: med
 */
/* func_ov002_021b3c10: search the d0650 node chain (start id in r0) for the first
 * node with tag(:4 at +2) < 6 AND key0(+0) == arg1; return that node pointer, else
 * 0. next(+6) is loaded into the return reg early (it doubles as the loop index). */

typedef unsigned short u16;

extern char data_ov002_022d0650[];

struct LNodeC10 { u16 key0; u16 tag : 4; u16 _rest : 12; u16 key1; u16 next; };

void *func_ov002_021b3c10(int idx, int key) {
    struct LNodeC10 *p;
    while (idx != 0) {
        p = (struct LNodeC10 *)(data_ov002_022d0650 + idx * 8);
        idx = p->next;
        if (p->tag < 6 && p->key0 == key) {
            return p;
        }
    }
    return 0;
}
