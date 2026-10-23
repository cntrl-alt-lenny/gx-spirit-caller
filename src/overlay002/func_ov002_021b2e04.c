typedef unsigned short u16;
typedef struct {
    u16 owner;
    u16 kind : 4;
    u16 rest : 12;
    u16 value;
    u16 next;
} Node;
typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
    char pad[6];
    u16 next;
    char tail[8];
} Card;
typedef struct {
    char pad[0x30];
    Card cards[12];
    char tail[0x748];
} Player;
extern Player data_ov002_022cf16c[];
extern Node data_ov002_022d0650[];
void func_ov002_021b2e04(int from, u16 to)
{
    int owner = from & 0xff;
    int card = (from >> 8) & 0xff;
    unsigned idx;
    int i, j;
    for (i = 0; i < 2; i++) {
        Player *p = &data_ov002_022cf16c[i & 1];
        for (j = 0; j <= 10; j++) {

            if (p->cards[j].id != 0 && (idx = p->cards[j].next) != 0) {
                do {
                    Node *n = &data_ov002_022d0650[idx];
                    idx = n->next;
                    if (n->kind >= 6) {
                        int a = n->owner & 0xff;
                        int b = (n->owner >> 8) & 0xff;
                        if (a == owner && b == card)
                            n->owner = to;
                    }
                } while (idx != 0);
            }
        }
    }
}





