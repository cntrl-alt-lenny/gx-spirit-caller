typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 slot:5; u16 rest:10; };
extern int func_ov002_021bc8c8(int, int, int);
extern int func_ov002_021ff2b8(int unused_a, int b);
extern int func_ov002_021bc288(int, int);
extern int func_ov002_021ca2b8();
extern int func_ov002_022536e8(int player, int arg1, int arg2);
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
int func_ov002_0220a328(struct Self *self) {
    unsigned int i;
    if (!func_ov002_021bc8c8(self->player, self->player, self->slot)) return 0;
    if (!func_ov002_021ff2b8((int)self, self->player)) {
        if (!func_ov002_021bc288(self->player, self->slot)) return 0;
    }
    if (!func_ov002_021ca2b8(self->player)) return 0;
    i = 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (self->player & 1) * 0x868) > i) do {
        if (func_ov002_022536e8(self->player, self->id, i)) return 1;
        i++;
    } while (i < *(unsigned int *)(data_ov002_022cf16c + (self->player & 1) * 0x868 + 0xc));
    return 0;
}



