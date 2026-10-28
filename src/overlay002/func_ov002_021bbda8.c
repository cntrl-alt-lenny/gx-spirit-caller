typedef struct { unsigned int id : 13; unsigned int owner : 1; unsigned int rest : 18; unsigned int pad[4]; } Slot;
extern char data_ov002_022cf16c[];
typedef struct { unsigned int count; char pad[0x864]; } Counts;
extern Counts data_ov002_022cf180[];
extern int func_0202df78(int a, int b);
int func_ov002_021bbda8(int player, int id) {
    int side;
    int i;
    int count = 0;
    int offset;
    int masked;
    Slot *p;
    char *row;
    Slot *slot;
    for (side = 0; side < 2; side++) {
        slot = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
        for (i = 0; i <= 10; i++, slot++) {
            if (player == slot->owner) {
                if (func_0202df78(slot->id, id)) count++;
            }
        }
    }
    masked = player & 1;
    offset = masked * 0x868;
    i = 0;
    if ((unsigned int)i < data_ov002_022cf180[player & 1].count) {
        row = data_ov002_022cf16c + offset;
        p = (Slot *)(row + 0x418);
        do {
            if (func_0202df78(p->id, id)) count++;
            i++;
            p = (Slot *)((char *)p + 4);
        } while ((unsigned int)i < *(unsigned int *)(row + 0x14));
    }
    return count;
}






