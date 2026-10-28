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
    char tail[16];
} Card;
typedef struct {
    char pad[0x30];
    Card cards[12];
    char tail[0x748];
} Player;
extern Player data_ov002_022cf16c[];
extern Node data_ov002_022d0658[];
extern void func_ov002_021b1d84(int id);
void func_ov002_021b29c0(void)
{
    int i;
    Node *n = data_ov002_022d0658;
    for (i = 1; i < 256; i++, n++) {
        if (n->kind == 8) {
            int owner = (unsigned char)n->owner;
            int index = (n->owner >> 8) & 0xff;
            unsigned int card = data_ov002_022cf16c[owner & 1].cards[index].id;
            switch (card) {
            case 0x1505:
            case 0x1644:
            case 0x1843:
            case 0x1958:
            case 0x1a4e:
            case 0x1a79:
                func_ov002_021b1d84(i);
                break;
            }
        }
    }
}
