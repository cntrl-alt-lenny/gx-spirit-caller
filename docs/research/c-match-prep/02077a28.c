/* CAMPAIGN-PREP candidate for func_02077a28 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted search loop, single back-edge, ptr reload on hit
 *   risk:       list[i] reloaded on hit (ldreq [r5,r6,lsl#2]); *(list[i]) double-deref signature; count loaded before list
 *   confidence: med
 */
extern int func_020aaf40(void *item, void *key);

struct S02077a28 {
    char pad814[0x814];
    void **list;                    /* +0x814 */
    int count;                      /* +0x818 */
};

void *func_02077a28(struct S02077a28 *p, void *key)
{
    int count = p->count;
    int i = 0;

    if (count > 0) {
        void **list = p->list;
        do {
            if (func_020aaf40(*(void **)list[i], key) == 0)
                return list[i];
            i++;
        } while (i < count);
    }

    return 0;
}
