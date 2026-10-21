typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
struct Slot { unsigned int id:13; unsigned int rest:19; u16 pad34; u16 f36; u16 f38; char pad[10]; };
struct Row { char pad[0x30]; struct Slot slots[5]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021d5a08(struct Ov002Self *, int, int, int, u16, u16);
extern int func_ov002_021d63fc(struct Ov002Self *, int, int, int);
extern int func_ov002_021d6808(struct Ov002Self *, int, int, int, int);
extern void func_ov002_021e276c(int side, int, int, int);
int func_ov002_02220f48(struct Ov002Self *self) {
    unsigned int id;
    int i;
    int player;
    struct Row *row;
    for (i=0; i<5; i++) {
        player = 1-self->b0;
        row = (struct Row *)(data_ov002_022cf16c + (player&1)*0x868);
        id = row->slots[i].id;
        if (id != 0) {
            if (row->slots[i].f36 != 0) {
                func_ov002_021d6808(self, player, i, row->slots[i].f38 == 0, 2);
            } else if (row->slots[i].f38 == 0) {
                func_ov002_021d63fc(self, player, i, 2);
            }
            func_ov002_021d5a08(self, 1-self->b0, i, self->f0, 3, 500);
        }
    }
    func_ov002_021e276c(1-self->b0, self->f0, 1, 0);
    return 0;
}








