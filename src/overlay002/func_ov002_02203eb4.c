typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
struct node { char pad[6]; u16 count:8; u16 other:8; u16 arr8[5]; u16 f18; };
typedef struct { char pad[0x494]; unsigned int index:7; unsigned int rest:25; } State;
typedef struct { char pad[0x38]; u16 active; char rest[0x12]; } Slot;
typedef struct { Slot slots[5]; char rest[0x740]; } Player;
extern State data_ov002_022ce288;
extern u16 data_ov002_022ce720[];
extern Player data_ov002_022cf16c[];
extern int func_ov002_021ff46c(S021ff3bc *p, int unused1);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021b9ecc(int side, int index);
extern int func_0202e79c(int arg0);
int func_ov002_02203eb4(S021ff3bc *p, struct node *n) {
    int i;
    if (!n) return 0;
    data_ov002_022ce720[data_ov002_022ce288.index] = 0;
    if (!func_ov002_021ff46c(p, (int)n)) return 0;
    for (i = 0; i < n->count; i++) {
        int pair = func_ov002_0223de94(n, i);
        unsigned int index = (u8)((u16)pair >> 8);
        if (index <= 4) {
            int side = (u8)pair;
            if (*(u16 *)((char *)data_ov002_022cf16c + (side & 1) * 0x868 + index * 0x14 + 0x38)) {
                if (func_0202e79c(func_ov002_021b9ecc(side, index))) return 1;
            }
        }
    }
    return 0;
}




