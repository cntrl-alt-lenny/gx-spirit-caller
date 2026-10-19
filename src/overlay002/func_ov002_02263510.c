typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    u32 id : 13;
    u32 flag : 1;
    u32 unused : 8;
    u32 value : 8;
    u32 rest : 2;
    u32 other;
    u16 active;
    unsigned char pad[10];
} Card;
typedef struct {
    unsigned char pad[0x30];
    Card cards[5];
    unsigned char tail[0x7d4];
} Player;
typedef struct {
    unsigned char pad[0xcec];
    u32 player;
    unsigned char gap[0x38];
    u32 cursor;
} State;
extern State data_ov002_022d016c;
extern Player data_ov002_022cf16c[2];
extern int func_ov002_021b9ecc(int player, int kind);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02263510(void) {
    while (data_ov002_022d016c.cursor < 10) {
        u32 player;
        u32 slot = data_ov002_022d016c.cursor % 5;
        player = data_ov002_022d016c.player ^ (data_ov002_022d016c.cursor / 5);
        int id = func_ov002_021b9ecc(player, slot);
        switch (id) {
        case 0x17d2: case 0x17d3: case 0x17d7: case 0x17d8: case 0x17da:
            if (data_ov002_022cf16c[player & 1].cards[slot].active != 0) {
                Card *card = &data_ov002_022cf16c[player & 1].cards[slot];
                func_ov002_021e30b4(((player << 31) & 0x80000000) | 0xa200000 | ((slot << 16) & 0x1f0000) | (u16)id,
                    (u16)(card->value * 2 + card->flag), 0);
                data_ov002_022d016c.cursor++;
                return 0;
            }
            break;
        }
        data_ov002_022d016c.cursor++;
    }
    return 1;
}

