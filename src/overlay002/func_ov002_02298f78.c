typedef unsigned int u32;
typedef struct { u32 id:13; u32 side:1; u32 pad:8; u32 tag:8; u32 rest:2; } Card;
extern char data_ov002_022cf16c[];
typedef struct { u32 count; char pad[0x864]; } CountRow;
extern CountRow data_ov002_022cf178[];
typedef struct { char pad[0xd60]; int key; int pad2[2]; int player; int owner; } State;
extern State data_ov002_022d016c;
extern int func_ov002_021c9e14(int arg0);
extern int func_ov002_0226eb48(int a, int b);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bcb10(int self, int id, int check);
extern int func_ov002_021bcf00(int a);
extern int func_ov002_021bbd14(int self, int arg2);
extern int func_ov002_02281994(void *arg0, int arg1);
extern int func_ov002_021bcd80(int self, int excludeKey);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_02271a78(int arg0, int arg1, int arg2);
int func_ov002_02298f78(void *self) {
    int offset;
    int player = (int)self;
    unsigned int i;
    int id, accept;

    Card *card;
    int opponent;
    char *row;
    if (func_ov002_021c9e14(player) == 0) return 0;
    offset = (player & 1) * 0x868;
    i = 0;
    if (i < data_ov002_022cf178[player & 1].count) {
        row = data_ov002_022cf16c + offset;
        opponent = 1-player;
        card = (Card *)(row + 0x120);
        do {
            id = card->id;
            if (func_ov002_0226eb48(player, card->tag * 2 + card->side) & 0x10) {
                accept = 0;
                switch (id) {
                case 0x1386: case 0x1387: case 0x1388: case 0x16ec:
                case 0x1b2e: case 0x1b2f: accept = 1; break;
                case 0x147b: if (*(u32 *)(row + 0xc) == 1) accept = 1; break;
                case 0x154b:
                    if (func_ov002_021bbf50(opponent) != 0 && func_ov002_021bcb10(player, id, 1) >= 3) accept = 1;
                    else accept = 0;
                    break;
                case 0x13b5:
                    if (func_ov002_021bcf00(opponent) != 0 && func_ov002_021bcb10(player, id, 1) >= 3) accept = 1;
                    else accept = 0;
                    break;
                case 0x1905: accept = func_ov002_021bbd14(player, id) == 0; break;
                case 0x19bc:
                    if (func_ov002_021bbd14(player, 0x1870) != 0 ||
                        (func_ov002_02281994(self, 0x18f6) != 0 &&
                        (func_ov002_02281994(self, 0x12e5) != 0 || func_ov002_02281994(self, 0x18fe) != 0))) accept = 1;
                    else accept = 0;
                    break;
                case 0x1870:
                    if (func_ov002_021bbd14(player, 0x1870) != 0 || func_ov002_021bbd14(player, 0x18f6) != 0) accept = 1;
                    else accept = 0;
                    break;
                case 0x185d:
                    if (func_ov002_021bcd80(player, -1) != 0 && func_ov002_022536e8(self, id, 0) != 0) accept = 1;
                    else accept = 0;
                    break;
                }
                if (accept != 0) {
                    data_ov002_022d016c.player = player;
                    data_ov002_022d016c.owner = player;
                    {
                        Card *selected = (Card *)(row + 0x120);
                        int key = selected[i].tag * 2 + selected[i].side;
                        data_ov002_022d016c.key = key;
                    }
                    func_ov002_02271a78(1, 0, 1);
                    return 1;
                }
            }
            card++;
            i++;
        } while (i < *(u32 *)(row + 0xc));
    }
    return 0;
}













