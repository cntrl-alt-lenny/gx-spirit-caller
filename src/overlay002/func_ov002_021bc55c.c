extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int data_ov002_022cd3f4[];

extern int func_ov002_021bc288(int a, int b);

struct Ov002Bits { unsigned int id : 13; };

int func_ov002_021bc55c(int side, int idx) {
    struct Ov002Bits *s = (struct Ov002Bits *)(data_ov002_022cf16c + (side & 1) * 0x868 + idx * 0x14 + 0x30);
    if (s->id) return 0;
    if (*(unsigned int *)(data_ov002_022d016c + 0xd0) & 1) {
        if (side == data_ov002_022cd3f4[0] && idx == data_ov002_022cd3f4[7]) {
            if (((struct Ov002Bits *)((char *)data_ov002_022cd3f4 + 0xc4))->id) return 0;
        }
        if (side == data_ov002_022cd3f4[1] && idx == data_ov002_022cd3f4[8]) {
            if (((struct Ov002Bits *)((char *)data_ov002_022cd3f4 + 0xd8))->id) return 0;
        }
    }
    return func_ov002_021bc288(side, idx) != 0;
}
