typedef unsigned short u16;
typedef unsigned char u8;
struct node {
    u16 f0;
    u16 side:1;
    u16 slot:5;
    u16 rest:10;
    u16 f4;
    u16 count:8;
    u16 high:8;
    u16 arr8[5];
    u16 f18;
};
struct Card { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct Player { char pad[0x30]; struct Card cards[11]; char tail[0x75c]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021b59b0(struct node *);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_02257ab8(int a, int b);
int func_ov002_0228a9a4(struct node *a, struct node *b)
{
    if (!b) return 0;
    if (b->side == a->side) return 0;
    switch (func_ov002_021b59b0(b)) {
    case 1:
    case 2:
        if (b->count == 1) {
            int r = func_ov002_0223de94(b, 0);
            u8 side = r;
            u16 v = r;
            int type = (v >> 8) & 0xff;
            unsigned int id = data_ov002_022cf16c[side & 1].cards[type].id;
            switch (id) {
            case 0x10dd: case 0x12fe: case 0x12ff: case 0x1435: case 0x14de: case 0x15f1:
                return 0;
            }
        }
        return 1;
    case 4:
    case 6:
        {
            int count = func_ov002_02257ab8((int)b, a->side);
            return count - func_ov002_0225764c((int)b, a->side, a->slot) > 0;
        }
    default:
        return 1;
    }
}


