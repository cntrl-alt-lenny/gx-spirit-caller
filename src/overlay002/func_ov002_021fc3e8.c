typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1; char pad[16]; u32 value; } Card;
typedef struct { int pad; int side; } Context;
typedef struct { char pad[4]; int side; char pad2[24]; int zone; } Selection;
typedef struct { char pad[0xcec]; int side; char pad2[8]; int state; char pad3[0x84]; int message; } State;
typedef struct { char pad[0x5d4]; u32 count; char pad2[4]; unsigned char tags[32]; u32 values[32]; } List;
typedef struct { u16 id; char pad[18]; } Entry;
typedef struct { Entry entries[107]; char pad[12]; } Player;
typedef struct { u32 flags; char pad[16]; } FlagEntry;
typedef struct { FlagEntry entries[107]; char pad[12]; } FlagPlayer;
extern Context data_ov002_022cd73c;
extern Selection data_ov002_022cd3f4;
extern State data_ov002_022d016c;
extern List data_ov002_022ce288;
extern Player data_ov002_022cf1a4[];
extern FlagPlayer data_ov002_022cf1ac[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202e234(int x);
extern int func_02031470(int x);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bd110(int player, int arg1);
extern int func_ov002_021fc818(Card *self, Card *other);
extern int func_ov002_021fd270(Card *self, Card *other);
int func_ov002_021fc3e8(Card *self, Card *other) {
    int valid;
    unsigned int i;
    unsigned int zone;
    if (self->id == 0) return 0;
    if (self->side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 4;
    self->mode = 0;
    if (self->flip) return 0;
    if (self->zone == 11) {
        if (func_0202e234(self->id)) {
            if (func_02031470(self->id) == 0) return 0;
            if (self->id != 0xfee) self->mode = 2;
        } else if (func_0202b878(self->id) == 22) {
            if (func_ov002_021bd110(self->side, self->id) == 0) return 0;
            if (data_ov002_022d016c.side != self->side) return 0;
            if (func_0202b8c0(self->id) == 0) {
                if (data_ov002_022d016c.state != 2 && data_ov002_022d016c.state != 4) return 0;
            }
            if (func_ov002_021bb068(0x1390) != 0) return 0;
        } else {
            unsigned int j;
            valid = 0;
            if (func_ov002_021bd110(self->side, self->id) == 0) return 0;
            if (func_ov002_021b3ecc(self->side, 11, 0x14a5)) valid = 1;
            if (func_ov002_021b3ecc(self->side, 11, 0x198a)) {
                if (func_ov002_021b3fd8(self->side, 11, 0x198a, 1) == 0) valid = 1;
            }
            if (data_ov002_022cd3f4.side == self->side) {
                for (j = 0; j < data_ov002_022ce288.count; j++) {
                    if (data_ov002_022ce288.tags[j] == 18) {
                        if (func_ov002_021baca8(data_ov002_022cd3f4.side, data_ov002_022cd3f4.zone, 0x18f5)) valid = 1;
                    }
                }
            }
            if (valid == 0) return 0;
        }
    } else {
        if (func_0202e234(self->id)) return 0;
        zone = self->zone;
        if (zone < 5) return 0;
        if (data_ov002_022cf1a4[self->side & 1].entries[zone].id != 0) return 0;
        if ((data_ov002_022cf1ac[self->side & 1].entries[zone].flags >> 20) & 1) {
            if (func_0202b878(self->id) == 23 && func_ov002_021bae7c(self->side, 0x146f, -1) == 0) {
                if (self->side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 1;
                return 0;
            }
            if (func_0202b8c0(self->id) == 5) {
                if (self->side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 1;
                return 0;
            }
        }
    }
    if (data_ov002_022ce288.count == 0) {
        if (func_ov002_021fc818(self, other) && func_ov002_021fd270(self, other)) return 1;
    } else {
        for (i = 0; i < data_ov002_022ce288.count; i++) {
            self->tag = data_ov002_022ce288.tags[i];
            self->value = data_ov002_022ce288.values[i];
            if (func_ov002_021fc818(self, other) && func_ov002_021fd270(self, other)) return 1;
        }
    }
    return 0;
}


