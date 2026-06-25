/* CAMPAIGN-PREP candidate for func_022872bc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf loop; per-player mla base; slot :13 walk-ptr; goto-shared ret0
 *   risk:       REG-ALLOC residue only: identical instr stream but base lands r2 vs orig r12 (consistent rename). 10-word diff is pure reg permutation -> permuter/.s.
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct Self { u16 f0; u16 b0 : 1; u16 rest : 15; };
struct Row { u32 id : 13; char pad[0x10]; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];

int func_ov002_022872bc(struct Self *self) {
    char *base;
    struct Row *p;
    int i;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 5) goto done;
    base = data_ov002_022cf16c + ((1 - self->b0) & 1) * 0x868;
    p = (struct Row *)(base + 0x94);
    for (i = 5; i <= 10; i++) {
        if (p->id != 0) {
            if ((*(u32 *)(base + 0x40 + i * 0x14) >> 0x14) & 1) return 1;
        }
        p++;
    }
done:
    return 0;
}
