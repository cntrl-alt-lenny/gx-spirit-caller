typedef unsigned short u16;
struct Self { u16 f0; u16 :6; u16 kind:6; u16 :4; };
struct Entry { unsigned id:13; unsigned :19; char pad[0x10]; };
struct Table { char pad[0x30]; struct Entry rows[1]; };
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(struct Self *self, int player, int index);
int func_ov002_022029e0(struct Self *self) {
    int kind = self->kind;
    int player = *(int *)data_ov002_022cd3f4;
    int index = *(int *)(data_ov002_022cd3f4 + 0x1c);
    if (!(kind != 0x12 && kind != 0x13 && kind != 0x14)) {
        unsigned offset = (player & 1) * 0x868;
        unsigned row = index * 0x14;
        if (((struct Table *)(data_ov002_022cf16c + offset))->rows[index].id != 0) {
            if (*(u16 *)(data_ov002_022cf1a4 + offset + row) != 0) {
                if (func_ov002_021c1ef0(self, player, index) != 0) return 1;
            }
        }
    }
    return 0;
}







