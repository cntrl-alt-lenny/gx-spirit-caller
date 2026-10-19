typedef unsigned int u32;
typedef struct { u32 id : 13; u32 rest : 19; } Entry;
typedef struct { char pad[0x120]; Entry first[80]; Entry second[110]; Entry third[276]; } Player;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf180[];
extern char data_ov002_022d016c[];
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021c3cf0(int player);
extern int func_0202e2c8(int unused0);
int func_ov002_0228083c(int player, int id) {
    int other;
    unsigned int index;
    Entry *cards;
    switch (id) {
    case 0x169d: {
        int offset = (player & 1) * 0x868;
        index = func_ov002_021b00d0(*(u32 *)(data_ov002_022cf17c + offset));
        id = ((Player *)(data_ov002_022cf16c + offset))->second[index].id;
        break;
    }
    case 0x1568:
        id = 0x161c;
        break;
    default:
        other = 1 - player;
        id = 0x161c;
        if (func_ov002_021c3cf0(other) && *(u32 *)(data_ov002_022cf178 + (other & 1) * 0x868)) {
            index = func_ov002_021b00d0(*(u32 *)(data_ov002_022cf178 + (other & 1) * 0x868));
            id = ((Player *)data_ov002_022cf16c)[(u32)other & 1].first[index].id;
        } else if (*(u32 *)(data_ov002_022cf180 + (other & 1) * 0x868)) {
            index = func_ov002_021b00d0(*(u32 *)(data_ov002_022cf180 + (other & 1) * 0x868));
            cards = ((Player *)data_ov002_022cf16c)[(u32)other & 1].third;
            if (!func_0202e2c8(cards[index].id))
                id = cards[index].id;
        }
    }
    *(int *)(data_ov002_022d016c + 0xd44) = id;
    return id;
}



