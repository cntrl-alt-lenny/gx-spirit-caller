/* CAMPAIGN-PREP candidate for func_02249310 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + :13 bitfield + bind-off (mul reuse) + walking-ptr loop
 *   risk:       0x418 splits to #0x18+#0x400 (immediate-split order mwcc-chosen); :13 must yield lsl19/lsr19 not and
 *   confidence: high
 */
/* func_ov002_02249310: per-parity table scan, tag matching entries. */

extern int func_0202e234(int key);
extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

struct ov002_ent { unsigned key : 13; };

void func_ov002_02249310(int idx) {
    int x = 1 - idx;
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
