typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 id;
    u16 side:1; u16 pad2:5; u16 kind:6; u16 pad3:4;
    u32 pad[4];
    u32 idx:9; u32 owner:1; u32 lim:4; u32 pad4:4;
    u32 other:1; u32 mode:4; u32 flag:1; u32 pad5:8;
} S;
struct Card { u16 id:13; u16 rest:3; u16 pad; };
extern struct Card data_ov002_022d0250[];
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
int func_ov002_02201b24(S *p) {
    int id;
    if (p->kind != 0x1b) return 0;
    if (p->other != p->side && p->owner == p->side) {
        id = data_ov002_022d0250[p->idx].id;
        switch (p->id) {
        case 0x134c:
            if (p->lim >= 5 && func_0202b878(id) != 0x17) {
                if (p->flag == 0 && p->mode == 0xe) return 1;
            }
            return 0;
        case 0x134d:
            if (p->lim >= 5 && func_0202b878(id) == 0x17) {
                if (p->flag == 0 && p->mode == 0xe) return 1;
            }
            return 0;
        case 0x135b:
            if (p->lim < 5 && func_0202e234(id) != 0) {
                if (p->mode == 0xb) return 1;
            }
            return 0;
        }
    }
    return 0;
}

