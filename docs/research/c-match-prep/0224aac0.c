/* CAMPAIGN-PREP candidate for func_0224aac0 (ov002, class C) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + :15/:2 bitfield (lsl15/lsr30) + inline ==2 predicate
 *   risk:       :15+:2 layout must yield lsl#15;lsr#30 (not and+cmp); 0x418 immediate-split order
 *   confidence: high
 */
/* func_ov002_0224aac0: per-parity table scan, tag entries whose 2-bit field at bit 15 == 2. */

extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

struct ov002_ent { unsigned : 15; unsigned sel : 2; };

void func_ov002_0224aac0(int idx) {
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
        if (e[i].sel == 2)
            func_ov002_02253458(x, 14, i);
    }
}
