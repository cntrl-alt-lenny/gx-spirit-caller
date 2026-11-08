typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 rest:19; } Slot;
typedef struct { int id; int pad[6]; int atk; int def; int rest[2]; } Stats;
typedef struct { u16 id; u16 kind:4; u16 rest:12; u16 value; u16 next; } Effect;
extern char data_ov002_022cf16c[], data_ov002_022cf1a4[], data_ov002_022cf1ac[];
extern char data_ov002_022cf1a8[], data_ov002_022cf1a6[], data_ov002_022d016c[];
extern Effect data_ov002_022d0650[];
extern int func_0202b8f0(int);
extern int func_0202b920(int);
extern int func_0202f218(int);
extern int func_ov002_021b3618(int, int);
extern int func_ov002_021b8fcc(int, int);
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021bc000(int, int (*)(int));
extern int func_ov002_021bd57c(u32, u32);
extern int func_ov002_021c2f24(int, int);
extern void func_ov002_021c4c9c(int, int, Stats *);
void func_ov002_021c46a8(int side, int slot, Stats *out)
{
    int pos = slot * 20;
    int off = (side & 1) * 0x868;
    u32 flags;
    int active;
    int swapped;
    int id;
    Effect *e;
    int effect;
    u32 link;
    Stats temp;
    id = ((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->id;
    flags = *(u32 *)(data_ov002_022cf1ac + off + pos);
    active = *(u16 *)(data_ov002_022cf1a4 + off + pos);
    active = active & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1);
    out->id = id;
    swapped = 0;
    out->atk = func_0202b8f0(out->id);
    out->def = func_0202b920(out->id);
    if (*(u16 *)(data_ov002_022cf1a4 + off + pos) == 0) return;
    out->id = func_ov002_021b9ecc(side, slot);
    switch (out->id) {
    case 0x120e:
        if (*(u32 *)(data_ov002_022cf1a8 + off + pos) != 0) {
            if (*(u32 *)(data_ov002_022d016c + 0xcf0) > *(u32 *)(data_ov002_022cf1a8 + off + pos)) {
                out->atk *= 2; out->def *= 2;
            } else {
                out->atk = (out->atk + 1) >> 1; out->def = (out->def + 1) >> 1;
            }
        }
        break;
    case 0x1472:
        if (func_ov002_021b8fcc(side, slot)) { out->atk = 1600; out->def = 1800; }
        break;
    case 0x14fc: swapped = 1; break;
    case 0x1636:
        if (func_ov002_021b8fcc(side, slot)) out->def = 3000;
        break;
    case 0x172f:
        if (func_ov002_021b8fcc(side, slot)) { out->atk = 1800; out->def = 500; }
        break;
    case 0x1809:
        if (func_ov002_021b8fcc(side, slot)) out->def = 2000;
        break;
    case 0x1838:
        if (*(int *)(data_ov002_022cf1a8 + off + pos)) { out->atk /= 2; out->def /= 2; }
        break;
    case 0x1864:
        if (*(int *)(data_ov002_022cf1a8 + off + pos)) out->atk = 2000;
        break;
    case 0x18b0:
        if (active) out->def = func_ov002_021bd57c(side, 6) * 700;
        break;
    case 0x18c5:
        if (active) {
            int a = func_ov002_021c2f24(side, 0xfbe);
            out->atk = a * 1000 + func_ov002_021c2f24(side, 0x18c5) * 1000;
        }
        break;
    case 0x18b4: case 0x18fb:
        out->atk = *(int *)(data_ov002_022cf1a8 + off + pos);
        out->def = *(int *)(data_ov002_022cf1a8 + off + pos);
        break;
    case 0x191b:
        if (active) out->atk = func_ov002_021bd57c(side, 9) * 1000;
        break;
    case 0x19d2:
        if (*(int *)(data_ov002_022cf1a8 + off + pos)) {
            int t = out->atk; out->atk = out->def; out->def = t;
        }
        break;
    case 0x1a1e:
        if (active && func_ov002_021bc000(side, func_0202f218) >= 2) { out->atk *= 2; out->def *= 2; }
        break;
    case 0x1a4e:
        out->atk = *(int *)(data_ov002_022cf1a8 + off + pos) * 800;
        out->def = *(int *)(data_ov002_022cf1a8 + off + pos) * 800;
        break;
    case 0x19ed:
        id = func_ov002_021b3618(side, slot);
        if (id != 0xffff) {
            func_ov002_021c4c9c(id & 0xff, ((u16)id >> 8) & 0xff, &temp);
            out->atk = temp.pad[4]; out->def = temp.pad[5];
        }
        swapped = 1;
        break;
    }
    link = *(u16 *)(data_ov002_022cf1a6 + off + pos);
    while (link != 0) {
        e = &data_ov002_022d0650[link];
        int kind = e->kind;
        effect = e->id;
        link = e->next;
        switch (kind) { case 2: case 4: case 5:
            switch (effect) {
            case 0x12cb: case 0x19f1:
                if (!swapped) { int t = out->atk; out->atk = out->def; out->def = t; }
                break;
            case 0x14b0: out->atk = e->value; break;
            case 0x1602: case 0x1608:
                e = &data_ov002_022d0650[link];
                out->atk = e->value;
                e = &data_ov002_022d0650[e->next];
                out->def = e->value;
                link = e->next;
                break;
            case 0x1621: out->atk = 200; break;
            }
        }
    }
}
