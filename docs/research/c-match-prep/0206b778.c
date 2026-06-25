/* CAMPAIGN-PREP candidate for func_0206b778 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted linear-search returning index, -1 sentinel
 *   risk:       conditional in-loop return (addeq/moveq/ldmeqia) vs a break+post-return; element field-0 type guessed
 *   confidence: high
 */
/* func_0206b778: linear search p->_4 list for an element whose first field
 * equals key; return its index, else -1.
 *
 *     n=func_02054140(p->_4); for(i=0;i<n;i++){
 *       e=func_020540d0(p->_4,i); if(key==e[0]) return i; }
 *     return -1;
 */

typedef struct Mgr Mgr;

extern int   func_02054140(void *list);
extern void *func_020540d0(void *list, int index);

struct Mgr {
    char _pad_00[0x4];
    void *list;            /* +0x4 */
};

int func_0206b778(Mgr *p, int key) {
    int i;
    int n = func_02054140(p->list);
    for (i = 0; i < n; i++) {
        int *e = (int *)func_020540d0(p->list, i);
        if (key == e[0])
            return i;
    }
    return -1;
}
