typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Self { char pad[2]; u16 player:1; };
struct Card { u32 id:13; u32 player:1; u32 rest:18; };
struct Entry { u32 id:9; u32 player:1; u32 rest:22; };
struct State { char pad[0x5d4]; u32 count; char pad2[4]; u8 types[1]; };
extern struct State data_ov002_022ce288;
extern struct Entry data_ov002_022ce884[];
extern u32 func_ov002_021b947c(int id);
extern struct Card *func_ov002_021c93f0(int player, int zone, int index);
extern unsigned int func_0202b8a8(int id);
int func_ov002_02286b84(struct Self *self) {
    u32 i;
    for (i=0; i<data_ov002_022ce288.count; i++) {
        if (data_ov002_022ce288.types[i] == 0x16) {
            u32 loc = func_ov002_021b947c(data_ov002_022ce884[i].id);
            if (loc != 0x1000) {
                struct Card *card = func_ov002_021c93f0((u8)loc, (u8)((u16)loc >> 8), (u16)(loc >> 16));
                u32 player = data_ov002_022ce884[i].player;
                if (player == self->player) {
                    if ((int)func_0202b8a8(card->id) > 4) return 1;
                }
                switch (card->id) { case 0xfd6: case 0x11e4:
                    if (card->player == self->player) return 1;
                    break;
                }
            }
        }
    }
    return 0;
}



