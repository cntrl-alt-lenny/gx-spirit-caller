extern char data_ov002_022cf16c[];
extern int func_0202e310(unsigned int id);

struct Slot {
    unsigned int id : 13;
    unsigned int rest : 19;
    char pad[4];
    unsigned short count;
    char pad2[10];
};

int func_ov002_021bd198(int player)
{
    int i;
    struct Slot *s;
    char *b = data_ov002_022cf16c + (player & 1) * 0x868;

    s = (struct Slot *)(b + 0x30);
    for (i = 0; i < 5; i++, s++, b += 0x14) {
        if (s->id != 0 && *(unsigned short *)(b + 0x38) != 0) {
            if (func_0202e310(s->id) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
