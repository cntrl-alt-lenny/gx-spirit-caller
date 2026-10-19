struct Slot {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int tag:8;
    unsigned int rest:2;
    char tail[16];
};
struct Row { char pad[0x30]; struct Slot slots[11]; };
struct Self { unsigned short f0, f2; unsigned short pad:6; unsigned short tag:9; unsigned short rest:1; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021c1ef0(struct Self *, int, int);
extern int func_ov002_021c2084(struct Self *, int, int, int);
int func_ov002_021e8cb4(struct Self *self, int player, int idx) {
    unsigned int id;
    int slot = idx * 20;
    int row = (player & 1) * 0x868;
    id = ((struct Row *)(data_ov002_022cf16c + row))->slots[idx].id;
    if (id == 0) return 0;
    if (idx < 5 || idx > 10) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + slot) != 0) {
        if (((*(unsigned int *)(data_ov002_022cf1ac + row + slot) >> 9) & 1) == 0) {
            if (func_0202b878(id) == 0x17) return 0;
        }
    }
    if (((struct Row *)(data_ov002_022cf16c + row))->slots[idx].tag * 2 + ((struct Row *)(data_ov002_022cf16c + row))->slots[idx].flag == self->tag) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    return func_ov002_021c2084(self, player, idx, 1) != 0;
}

