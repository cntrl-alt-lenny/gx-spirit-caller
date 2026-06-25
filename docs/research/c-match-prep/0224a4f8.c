/* CAMPAIGN-PREP candidate for func_0224a4f8 (ov002, class C) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + :13 bitfield + bind-off (mul reuse); x=idx (mov, no rsb)
 *   risk:       0x418 immediate-split order; :13 vs and; identical body to 02249310/ab44 (clone, but arg differs by x=idx)
 *   confidence: high
 */
/* func_ov002_0224a4f8: per-parity table scan, tag matching entries. */

extern int func_0202e234(int key);
extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

struct ov002_ent { unsigned key : 13; };

void func_ov002_0224a4f8(int idx) {
    int x = idx;
    int off = (x & 1) * 0x868;
    char *base;
    struct ov002_ent *e;
    int i;

    if (*(unsigned int *)(data_ov002_022cf180 + off) == 0)
        return;

    base = data_ov002_022cf16c + off;
    e = (struct ov002_ent *)(base + 0x418);
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++) {
        if (func_0202e234(e[i].key) != 0)
            func_ov002_02253458(x, 14, i);
    }
}
