/* CAMPAIGN-PREP candidate for func_021b3dd0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counter scan loop; :4 bitfield; && short-circuit (conditional key1 load); count++
 *   risk:       loop reg-alloc may flip; key1 must load conditionally (ldreqh) — guaranteed by && order
 *   confidence: med
 */
/* func_ov002_021b3dd0: count d0650 nodes (chain from r0) where tag(:4 at +2) < 6
 * AND key0(+0)==arg1 AND key1(+4)==arg2. key1 is loaded only when key0 matches
 * (ldreqh). next(+6) loaded into r0 early. */

typedef unsigned short u16;

extern char data_ov002_022d0650[];

struct LNodeDd0 { u16 key0; u16 tag : 4; u16 _rest : 12; u16 key1; u16 next; };

int func_ov002_021b3dd0(int idx, int key0v, int key1v) {
    struct LNodeDd0 *p;
    int count = 0;
    while (idx != 0) {
        p = (struct LNodeDd0 *)(data_ov002_022d0650 + idx * 8);
        idx = p->next;
        if (p->tag < 6 && p->key0 == key0v && p->key1 == key1v) {
            ++count;
        }
    }
    return count;
}
