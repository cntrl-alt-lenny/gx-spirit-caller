typedef unsigned char u8;
typedef unsigned short u16;

struct F2498_H {
    u16 b0 : 1;
    u16 f1 : 5;
    u16 f6 : 6;
    u16 f12 : 2;
    u16 rest : 2;
};

struct F2498_W {
    unsigned int lo : 9;
    unsigned int player : 1;
    unsigned int idx : 4;
    unsigned int rest : 18;
};

struct F2498_Self {
    u16 f0;
    struct F2498_H h;
    char pad[16];
    struct F2498_W w;
};

struct F2498_Slot { unsigned int id : 13; char pad[16]; };
struct F2498_Player { char pad[0x30]; struct F2498_Slot slot[11]; char pad2[0x868 - 0x30 - 11 * 20]; };

extern struct F2498_Player data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int IsValue12D3Or147E(int x);

int func_ov002_02201498(struct F2498_Self *self, struct F2498_Self *p) {
    unsigned int k;
    if (p != 0) {
        if (func_0202e234(p->f0) != 0) return 0;
        if (p->h.f1 > 10) return 0;
        if (p->h.f12 != 0) return 0;
        return IsValue12D3Or147E(p->f0) == 0;
    }
    k = self->h.f6;
    if (k != 0x1f && k != 0x20 && k != 0x21) goto end;
    if (data_ov002_022cf16c[self->w.player & 1].slot[self->w.idx].id != 0) return 1;
end:
    return 0;
}
