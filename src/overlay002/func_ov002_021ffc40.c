typedef unsigned short u16;
typedef unsigned char u8;
struct node {
    u16 code;
    u16 bit0:1;
    u16 index:5;
    u16 pad:8;
    u16 bit14:1;
    u16 rest:1;
    char pad4[4];
    u16 arr8[5];
    u16 f18;
};
struct Entry { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct State { char pad[0x30]; struct Entry entries[10]; char tail[0x770]; };
extern struct State data_ov002_022cf16c[];
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern unsigned int func_0202b878(int id);
extern void func_ov002_021fd668(int player, int index, int id);
int func_ov002_021ffc40(struct node *self, struct node *other) {
    int pair;
    int player, index;
    u16 id;
    int i;
    if (other == 0) return 0;
    if ((other->bit0 ^ other->bit14) == self->bit0) return 0;
    switch (other->code) {
    case 0xffa: case 0x1086: case 0x12e6: case 0x132d:
    case 0x134c: case 0x134d: case 0x1364: case 0x16b8: {
        pair = func_ov002_0223de94(other, 0);
        player = (u8)pair;
        index = (u8)((u16)pair >> 8);
        id = data_ov002_022cf16c[player & 1].entries[index].id;
        if (id == 0) return 0;
        if (player == self->bit0 && index == self->index) return 0;
        return func_0202b878(id) == 0x17;
    }
    case 0x149b: {
        pair = func_ov002_0223de94(other, 0);
        player = (u8)pair;
        index = (u8)((u16)pair >> 8);
        id = data_ov002_022cf16c[player & 1].entries[index].id;
        if (id == 0) return 0;
        if (player == self->bit0 && index == self->index) return 0;
        if (func_0202b878(id) == 0x17) return 1;
        func_ov002_021fd668(player, index, id);
        return 0;
    }
    case 0x11f0: {

        for (i = 0; i < 2; i++) {
            pair = func_ov002_0223de94(other, i);
            player = (u8)pair;
            index = (u8)((u16)pair >> 8);
            id = data_ov002_022cf16c[player & 1].entries[index].id;
            if (id != 0 && !(player == self->bit0 && index == self->index)) {
                if (func_0202b878(id) == 0x17) return 1;
            }
        }
        return 0;
    }
    case 0x1246: case 0x131b: case 0x131c: case 0x1321: {

        for (i = 5; i < 10; i++) {
            id = data_ov002_022cf16c[self->bit0 & 1].entries[i].id;
            if (id != 0 && i != self->index) {
                if (func_0202b878(id) == 0x17) return 1;
            }
        }
        return 0;
    }
    }
    return 0;
}





