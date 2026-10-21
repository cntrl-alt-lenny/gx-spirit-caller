typedef struct {
    unsigned short id;
    unsigned short side:1, zone:5, tag:6, pad:2, flip:1, rest:1;
} Card;
typedef struct { unsigned int flags; char pad[16]; } Entry;
typedef struct { Entry entries[12]; char pad[0x778]; } Player;
typedef struct { int pad; int side; } Context;
typedef struct { char pad0[0xd0]; unsigned int flags; char pad1[0xc18]; int side; char pad2[8]; int state; char pad3[0x84]; int message; } State;
extern Player data_ov002_022cf1ac[];
extern Context data_ov002_022cd73c;
extern State data_ov002_022d016c;
extern int func_02030c7c(int id);
extern int func_ov002_021b4684(int id, int tag);
extern int func_ov002_021b4b64(int a);
int func_ov002_021fc818(Card *self, Card *other) {
    int side = self->side ^ self->flip;
    if (other) {
        int value = func_02030c7c(self->id);
        if (value < func_02030c7c(other->id)) return 0;
        if (func_02030c7c(self->id) < 2) return 0;
        if (self->zone >= 5 && self->zone <= 10) {
            unsigned int flags = data_ov002_022cf1ac[self->side & 1].entries[self->zone].flags;
            if (((flags >> 1) | (flags >> 2)) & 1) return 0;
        }
    } else {
        if (func_02030c7c(self->id) < 2 && self->id != 0x131e && self->id != 0x14d7 && self->id != 0x154c) {
            if (self->tag > 5) {
                int valid = 0;
                if (self->zone <= 4) {
                    if (self->tag == 6 || (int)self->tag == 7 || self->tag == 8) valid = 1;
                }
                if (valid == 0) {
                if (side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 0x16;
                return 0;
            }
            }
            if (!(data_ov002_022d016c.side == side && (data_ov002_022d016c.state == 2 || data_ov002_022d016c.state == 4))) {
                if (side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 0x16;
                return 0;
            }
        }
    }
    if ((data_ov002_022d016c.flags & 1) && func_ov002_021b4684(self->id, self->tag) == 0) {
        if (side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 0x15;
        return 0;
    }
    if ((self->tag == 0x1f || (int)self->tag == 0x20 || self->tag == 0x21) && other == 0) {
        if (func_ov002_021b4b64(self->id) == 0) return 0;
    }
    return 1;
}





