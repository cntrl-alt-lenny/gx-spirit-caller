/* CAMPAIGN-PREP candidate for func_02067b8c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bounded-counter if-guard + post-increment + indexed byte store
 *   risk:       store offset folds via addlt r0,r0,r3 then strb #0x2c; struct layout (items at 0x2c, count at 0x40) guessed; predication vs branch could differ
 *   confidence: med
 */
/* func_02067b8c — bounded counter + conditional byte store.
 * r3 = p->count (+0x40); if (r3 < 0x14) { p->count = r3+1; store
 * byte arg1 at (p + r3) + 0x2c. } All predicated (addlt/strlt/strltb),
 * single bx lr — an if-guard with no else. addlt r0,r0,r3 folds the
 * index into the base so the byte store is at p[r3 + 0x2c].
 */
typedef struct Slot Slot;
struct Slot {
    char _pad_00[0x2c];
    unsigned char items[0x14]; /* +0x2c, indexed by old count */
    char _pad_40[0x40 - (0x2c + 0x14)];
    int  count;                /* +0x40 */
};

void func_02067b8c(Slot *p, int v) {
    int n = p->count;
    if (n < 0x14) {
        p->count = n + 1;
        p->items[n] = (unsigned char)v;
    }
}
