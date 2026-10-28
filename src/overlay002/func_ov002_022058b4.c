typedef unsigned short u16;
struct Card { u16 id; u16 player:1; u16 pad:11; u16 field:2; u16 rest:2; };
extern int func_0202e234(int x);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021b6600(struct Card *card);
extern char data_ov002_022cf178[];
int func_ov002_022058b4(struct Card *self, struct Card *card) {
    if (card == 0) return 0;
    if (func_0202e234(card->id) == 0) {
        if (card->field != 0) return 0;
        if (func_0202b8c0(card->id) == 4) return 0;
    }
    if (self->id == 0x15ab) {
        if (*(int *)(data_ov002_022cf178 + ((1 - self->player) & 1) * 0x868) == 0) return 0;
    }
    if (card->player == self->player)
        return (func_ov002_021b6600(card) & 1) > 0;
    else
        return (func_ov002_021b6600(card) & 2) > 0;
}
