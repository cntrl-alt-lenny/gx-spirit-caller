/* CAMPAIGN-PREP candidate for func_020891fc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     relative-offset table walk; bind G, reload G->h; signed+unsigned guards
 *   risk:       field offsets forced by asm so should match; entry[idx+1] addressing fold could vary
 *   confidence: high
 */
/* func_020891fc — clone of func_02089134, field rel[7] (offset 0x24). */

typedef struct { int count; int entry[1]; } RelTable;
typedef struct { char _pad[0x08]; int rel[8]; } Hdr;
typedef struct { char _pad[0x8c]; Hdr *h; } Mgr;

extern Mgr *data_021a5800;

void *func_020891fc(int idx) {
    Mgr *g = data_021a5800;
    int o = g->h->rel[7];
    RelTable *t = o ? (RelTable *)((char *)g->h + o) : 0;
    int v;
    if (t == 0) return 0;
    if (idx < 0) return 0;
    if ((unsigned int)idx >= (unsigned int)t->count) return 0;
    v = t->entry[idx];
    return v ? (char *)g->h + v : 0;
}
