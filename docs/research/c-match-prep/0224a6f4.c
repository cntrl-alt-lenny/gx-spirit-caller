/* CAMPAIGN-PREP candidate for func_0224a6f4 (ov002, class C) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail (17c) + :13 bitfield + ==K predicate; array@0x260, count@0x10
 *   risk:       0x260 single immediate (no split); :13 vs and; guard reloads data_022cf17c separately from base
 *   confidence: high
 */
/* func_ov002_0224a6f4: per-parity table scan (count@0x10), tag entries whose state==0x16. */

extern int func_0202b878(int key);
extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];

struct ov002_ent { unsigned key : 13; };

void func_ov002_0224a6f4(int idx) {
    int x = idx;
    int off = (x & 1) * 0x868;
    char *base;
    struct ov002_ent *e;
    int i;

    if (*(unsigned int *)(data_ov002_022cf17c + off) == 0)
        return;

    base = data_ov002_022cf16c + off;
    e = (struct ov002_ent *)(base + 0x260);
    for (i = 0; i < *(unsigned int *)(base + 0x10); i++) {
        if (func_0202b878(e[i].key) == 0x16)
            func_ov002_02253458(x, 13, i);
    }
}
