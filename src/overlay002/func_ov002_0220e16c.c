typedef unsigned short u16;
struct Card {
    u16 id;
    u16 side : 1;
    u16 pad : 11;
    u16 kind : 2;
    u16 rest : 2;
};
extern int func_0202e234(int x);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021b6600(struct Card *card);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
int func_ov002_0220e16c(struct Card *self, struct Card *card) {
    if (card == 0) return 0;
    if (func_0202e234(card->id) == 0) {
        if (card->kind != 0) return 0;
        if (func_0202b8c0(card->id) == 4) return 0;
    }
    switch (self->id) {
    case 0x1b23:
        if (*(int *)(data_ov002_022cf16c + 0x10) == 0) return 0;
        if (*(int *)(data_ov002_022cf16c + 0x878) == 0) return 0;
        break;
    case 0x1b24:
        if (*(int *)(data_ov002_022cf184 + (self->side & 1) * 0x868) == 0) return 0;
        break;
    }
    return func_ov002_021b6600(card) > 0;
}
