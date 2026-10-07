typedef unsigned int u32;

struct Ent { int off; u32 size; int pad8; int padc; };
struct Tab { int pad0; int pad4; u32 count; struct Ent ents[1]; };
struct Pool { char pad0[0x34]; char io[0x50]; struct Tab *tab; };

extern struct Pool *data_021a5800;
extern int func_02097ea4(void *io, int pos, int mode);
extern int func_02097f10(void *io, void *dst, u32 n);

int func_0208906c(u32 idx, void *dst, u32 n, int off)
{
    struct Pool *p = data_021a5800;
    struct Tab *t = p->tab;
    struct Ent *e;
    u32 avail;
    if (idx >= t->count) {
        return -1;
    }
    e = &t->ents[idx];
    avail = e->size - off;
    if (n > avail) {
        n = avail;
    }
    if (func_02097ea4(p->io, e->off + off, 0) == 0) {
        return -1;
    }
    return func_02097f10(p->io, dst, n);
}
