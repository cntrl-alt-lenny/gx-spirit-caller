struct Ent {
    unsigned int id : 13;
    unsigned int rest : 19;
};

struct Side {
    char pad0[0xc];
    unsigned int count;
    char pad1[0x120 - 0x10];
    struct Ent ents[1];
    char pad2[0x868 - 0x124];
};

extern struct Side data_ov002_022cf16c[];
extern unsigned short data_ov002_022cb9a8[];

int func_ov002_022818a4(int player)
{
    struct Side *s = &data_ov002_022cf16c[player & 1];
    unsigned int i = 0;
    unsigned int count = s->count;
    unsigned int j;

    for (; i < 0x19; i++) {
        for (j = 0; j < count; j++) {
            if (data_ov002_022cb9a8[i] == s->ents[j].id) {
                return j;
            }
        }
    }
    return -1;
}
