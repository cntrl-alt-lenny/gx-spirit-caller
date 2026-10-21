typedef unsigned short u16;
typedef struct {
    u16 owner;
    u16 kind : 4;
    u16 rest : 12;
    u16 pad4;
    u16 next;
} Node;
typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
    char pad[6];
    u16 head;
    char tail[8];
} Card;
typedef struct {
    char pad[0x30];
    Card cards[12];
    char tail[0x748];
} Player;
extern Player data_ov002_022cf16c[];
extern Node data_ov002_022d0650[];
extern void func_ov002_021b1d84(int id);
void func_ov002_021b2ab4(void)
{
    int player, i;

    for (player = 0; player < 2; player++) {
        Player *p = &data_ov002_022cf16c[player & 1];
        for (i = 0; i <= 11; i++) {
            int id, next;
            if (i != 11 && p->cards[i].id == 0)
                continue;
            id = p->cards[i].head;
            if (id == 0)
                continue;
            do {
                Node *n = &data_ov002_022d0650[id];
                next = n->next;
                if (n->kind == 4) {
                    func_ov002_021b1d84(id);
                } else if (n->kind >= 6) {
                    int owner = (unsigned char)n->owner;
                    int index = (n->owner >> 8) & 0xff;
                    int card = data_ov002_022cf16c[owner & 1].cards[index].id;
                    switch (card) { case 0x1852: case 0x1561: func_ov002_021b1d84(id); break; }
                }
                id = next;
            } while (next != 0);
        }
    }
}










