typedef unsigned short u16;
typedef unsigned char u8;
struct node {
    char _pad[8];
    u16 arr8[5];
    u16 f18;
};
typedef struct {
    u16 id;
    u16 player:1;
    u16 index:5;
    u16 rest:10;
    u16 pad;
    u16 count:8;
    u16 rest6:8;
} Header;
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021b59b0(struct node *arg0);
int func_ov002_0228b5f4(Header *self, struct node *arg1) {
    int val;
    unsigned short half;
    u8 index;
    int i;
    if (!arg1) return 0;
    switch (((Header *)arg1)->count) {
    default:
        for (i = 0; i < ((Header *)arg1)->count; i++) {
            val = func_ov002_0223de94(arg1, 0);
            half = (unsigned short)val;
            index = (u8)(half >> 8);
            return (val & 0xff) == self->player && index == self->index;
        }
        break;
    case 0:
        if (func_ov002_021b59b0(arg1) >= 4) return 1;
        break;
    }
    return 0;
}


