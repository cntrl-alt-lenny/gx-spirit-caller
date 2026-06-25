/* CAMPAIGN-PREP candidate for func_021b3d7c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counter scan loop; :4 bitfield reused twice; chained && (cmpeq); count++
 *   risk:       tag (ip) vs count reg colouring may flip; mwcc must CSE p->tag rather than reload it
 *   confidence: med
 */
/* func_ov002_021b3d7c: count d0650 nodes (chain from r0) where tag(:4 at +2) < 6
 * AND key0(+0)==arg1 AND tag==arg2. tag is extracted once and reused in both
 * compares (cmpeq chain). next(+6) loaded into r0 early. */

typedef unsigned short u16;

extern char data_ov002_022d0650[];

struct LNodeD7c { u16 key0; u16 tag : 4; u16 _rest : 12; u16 key1; u16 next; };

int func_ov002_021b3d7c(int idx, int key, int tagval) {
    struct LNodeD7c *p;
    int count = 0;
    while (idx != 0) {
        p = (struct LNodeD7c *)(data_ov002_022d0650 + idx * 8);
        idx = p->next;
        if (p->tag < 6 && p->key0 == key && p->tag == tagval) {
            ++count;
        }
    }
    return count;
}
