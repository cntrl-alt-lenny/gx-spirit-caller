typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 id;
    u16 side:1;
    u16 pad:5;
    u16 type:6;
    u16 state:2;
    u16 flip:1;
    u16 rest:1;
    u32 padding[4];
    u32 unused:9;
    u32 owner:1;
    u32 slot:4;
    u32 extra:18;
} Entry;
typedef struct { u32 value:13; u32 rest:19; } Value;
extern int IsValue12D3Or147E(int a0);
extern int func_ov002_021b87f8(Entry *a);
typedef struct { Value value; char pad[16]; } Card;
 typedef struct { int life; char pad[44]; Card cards[105]; char tail[4]; } Player;
extern Player data_ov002_022cf16c[];
int func_ov002_02204840(Entry *a, Entry *b) {
    if (b) {
        if (!IsValue12D3Or147E(b->id) && func_ov002_021b87f8(b)) {
            if (data_ov002_022cf16c[(a->side ^ a->flip) & 1].life > 800)
                return 2;
        }
    } else {
        switch (a->type) {
        case 31:
        case 32:
            return 0;
        case 33: {
            unsigned int owner = a->owner;

            unsigned int slot = a->slot;
            if (data_ov002_022cf16c[owner & 1].cards[slot].value.value) {
                if (data_ov002_022cf16c[(a->side ^ a->flip) & 1].life > 800)
                    return 2;
            }
            return 0;
        }
    }
    }
    return a->state != 3;
}





