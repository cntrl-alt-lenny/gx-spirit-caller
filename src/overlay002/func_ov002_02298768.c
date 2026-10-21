typedef struct { unsigned int id:13; unsigned int player:1; unsigned int rest:18; } Card;
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf178[];
extern unsigned char data_ov002_022d016c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202e234(int x);
extern int func_ov002_021b8f80(int arg0);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bcf00(int a);
extern int func_ov002_021bd09c(int arg0);
extern int func_ov002_021c9be8(int arg0, int arg1);
extern int func_ov002_021c9c48(int arg0);
extern void func_ov002_02259774(int bit0, int val5, int val8, int flag);
extern int func_ov002_0228130c(int player, int id);
extern int func_ov002_022819d4(int arg0);

int func_ov002_02298768(int player) {
    int selected = -1;
    unsigned int i;
    int id;
    int offset;
    Card *card;
    unsigned char *row;
    int fallback = -1;
    if (func_ov002_021bd09c(player) >= 2 &&
        func_ov002_021c9c48(player) != 0 &&
        func_ov002_022819d4(player) != 0) {
        offset = (player & 1) * 0x868;
        i = 0;
        if (i < *(unsigned int *)(data_ov002_022cf178 + offset)) {
            row = data_ov002_022cf16c + offset;
            card = (Card *)(row + 0x120);
            do {
            id = card->id;
            if (func_0202e234(id) == 0 && func_ov002_021c9be8(player, id) != 0 &&
                func_ov002_0228130c(player, id) != 0 && func_ov002_021b8f80(id) == 0) {
                fallback = 1;
                if (func_0202b878(id) == 0x16) {
                    if (func_0202b8c0(id) == 5 || func_ov002_021bb068(0x1390) != 0)
                        fallback = 1;
                    else
                        fallback = 0;
                }
                if (player != card->player) fallback = 0;
                switch (id) {
                case 0x10dd: fallback = 1; break;
                case 0x131e: fallback = 1; break;
                case 0x138f: fallback = 0; break;
                case 0x1435: fallback = 1; break;
                }
                {
                    int accept = fallback;
                    fallback = i;
                    if (accept != 0) {
                        selected = i;
                        break;
                    }
                }
            }
                card++;
                i++;
            } while (i < *(unsigned int *)(row + 0xc));
        }
        if (selected < 0 && fallback >= 0 && func_ov002_021bcf00(player) == 0 &&
            *(unsigned int *)(data_ov002_022cf178 + offset) >= 5) selected = fallback;
        if (selected >= 0) {
            *(int *)(data_ov002_022d016c + 0xd6c) = player;
            func_ov002_02259774(player, 11, selected, 7);
            *(int *)(data_ov002_022d016c + 0xd54) = 1;
            return 1;
        }
    }
    return 0;
}


