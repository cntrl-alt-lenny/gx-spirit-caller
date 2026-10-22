typedef unsigned short u16;
typedef struct {
    u16 owner;
    u16 kind : 4;
    u16 flags : 4;
    u16 rest : 8;
    u16 value;
    u16 next;
} Node;
typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
    char tail[16];
} Card;
typedef struct {
    char pad[0x30];
    Card cards[12];
    char tail[0x748];
} Player;
extern Player data_ov002_022cf16c[];
extern Node data_ov002_022d0650[];
void func_ov002_021b2d4c(int a, int b, int index, int kind, int value)
{
    Node *n = &data_ov002_022d0650[index];
    if (kind == 0) {
        n->flags = 0;
        n->owner = 0;
        kind = 1;
    } else if (n->kind >= 6 && kind < 6) {
        int owner = (unsigned char)n->owner;
        int card = (n->owner >> 8) & 0xff;
        n->owner = data_ov002_022cf16c[owner & 1].cards[card].id;
    }
    n->kind = (u16)kind;
    n->value = value;
}
