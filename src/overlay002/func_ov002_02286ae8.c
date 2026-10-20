typedef unsigned short u16;
typedef unsigned int u32;
struct Self { char pad[2]; u16 player:1; };
struct Card { char pad[0x30]; u32 id:13; u32 rest:19; char pad34[4]; u16 value; char pad3a[2]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_02257ab8(int a, int b);
extern int func_ov002_021c2624(int player, int idx, int id);
int func_ov002_02286ae8(struct Self *self) {
    int i;
    if (func_ov002_02257ab8((int)self, self->player) == 0) return 0;
    for (i = 5; i < 10; i++) {
        int player = 1 - self->player;
        struct Card *card = (struct Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + i * 0x14);
        if (card->id != 0 && card->value != 0) {
            if (func_ov002_021c2624(player, i, card->id) != 0) return 1;
        }
    }
    return 0;
}
