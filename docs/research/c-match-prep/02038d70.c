/* CAMPAIGN-PREP candidate for func_02038d70 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null->base else advance; bounded linked scan, stride 0x5c, return ptr
 *   risk:       struct size 0x5c and f4 offset guessed; pointer-compare bound should emit bcs as orig
 *   confidence: high
 */
/* func_02038d70 - if NULL start at base else step one; scan until f4!=0 or end sentinel */

typedef struct {
    int  f0;
    int  f4;
    char rest[0x54];
} Node;               /* 0x5c */

extern Node data_0219c4e8;    /* table start */
extern Node data_0219d068;    /* one-past-end sentinel */

Node *func_02038d70(Node *p)
{
    if (p == 0)
        p = &data_0219c4e8;
    else
        p++;

    while (p < &data_0219d068) {
        if (p->f4 != 0)
            return p;
        p++;
    }
    return 0;
}
