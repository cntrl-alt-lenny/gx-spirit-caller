struct Obj {
    unsigned short f0;
    unsigned short pad2:6;
    unsigned short type:6;
    unsigned short rest2:4;
    char pad4[16];
    unsigned int card:9;
    unsigned int side:1;
    unsigned int slot:4;
    unsigned int rest14:18;
};
struct Entry { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct Player { char pad[0x30]; struct Entry entries[5]; char tail[0x7d4]; };
extern struct Player data_ov002_022cf16c[];
struct Card { unsigned short id:13; unsigned short rest:3; unsigned short other; };
extern struct Card data_ov002_022d0250[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021bbbc0(int side, unsigned int attr, int skip);
int func_ov002_0220b31c(struct Obj *self, int arg) {
    int side;
    unsigned int attr;
    if (arg != 0) return 0;
    switch (self->type) { case 0x1f: case 0x20: case 0x21:
        attr = self->side & 1;
        if (data_ov002_022cf16c[attr].entries[self->slot].id != 0) {
            attr = func_0202b878(data_ov002_022d0250[self->card].id);
            if (func_ov002_021bbbc0(0, attr, self->side == 0 ? self->slot : -1) != 0) return 1;
            if (func_ov002_021bbbc0(1, attr, self->side == 1 ? self->slot : -1) != 0) return 1;
        }
    }
    return 0;
}





