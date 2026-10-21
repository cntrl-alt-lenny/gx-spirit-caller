typedef unsigned short u16;
typedef struct {
    u16 id;
    u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1;
    char pad[16];
    unsigned int value;
} Card;
typedef struct { int pad; int side; } Context;
typedef struct { char pad[0xd80]; int message; } State;
typedef struct { u16 id; char pad[18]; } Entry;
typedef struct { Entry entries[107]; char pad[12]; } Player;
typedef struct { char pad[0x5d4]; unsigned int count; char pad2[4]; unsigned char tags[32]; unsigned int values[32]; } List;
extern Context data_ov002_022cd73c;
extern State data_ov002_022d016c;
extern Player data_ov002_022cf1a4[];
extern List data_ov002_022ce288;
extern int func_0202e234(int x);
extern int func_0202e340(int unused0);
extern int func_0203158c(int x);
extern int func_ov002_021b34f4(int row_sel, int col_idx, int lo_want, int hi_want);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_0225753c(u16 id);
extern int func_ov002_021fc818(Card *self, Card *other);
extern int func_ov002_021fd270(Card *self, Card *other);
int func_ov002_021fc1a0(Card *self, Card *other) {
    unsigned int i;
    int pair;
    int side = self->side ^ self->flip;
    if (side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 4;
    if (self->id == 0) return 0;
    self->mode = 3;
    if (data_ov002_022cf1a4[self->side & 1].entries[self->zone].id == 0) return 0;
    if (func_ov002_0225753c(self->id) == 0) return 0;
    if (self->flip) {
        if (func_0203158c(self->id) == 0) return 0;
    }
    if (func_0202e234(self->id)) {
        if (self->zone >= 5) {
            if (func_0202e340(self->id) == 0) return 0;
            pair = func_ov002_021b3618(self->side, self->zone);
            if (pair == 0xffff) return 0;
            if (func_ov002_021b34f4((unsigned char)pair, (unsigned char)(pair >> 8), self->side, self->zone) != 11) return 0;
        }
    } else {
        if (self->zone < 5) return 0;
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


