/* CAMPAIGN-PREP candidate for func_02038dac (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     backward table scan, stride 0x5c, 32 entries, match f4==key
 *   risk:       struct size 0x5c / f4 offset guessed; bpl loop (i>=0) should match the subs;bpl
 *   confidence: high
 */
/* func_02038dac - scan 32 records backward from data_0219d00c, return one whose f4==key */

typedef struct {
    int  f0;
    int  f4;
    char rest[0x54];
} Node;               /* 0x5c */

extern Node data_0219d00c;

Node *func_02038dac(int key)
{
    Node *e = &data_0219d00c;
    int i;

    for (i = 0x1f; i >= 0; i--) {
        if (e->f4 == key)
            return e;
        e--;
    }
    return 0;
}
