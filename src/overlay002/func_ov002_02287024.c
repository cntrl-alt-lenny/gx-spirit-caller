struct Card {
    unsigned short pad0;
    unsigned short player : 1;
    unsigned short rest : 15;
};
struct Slot {
    char pad0[0x30];
    unsigned int id : 13;
    unsigned int rest : 19;
    unsigned int pad34;
    unsigned short active;
};
struct Player { char bytes[0x868]; };
extern struct Player data_ov002_022cf16c[];
extern unsigned int func_0202b890(int id);
int func_ov002_02287024(struct Card *p)
{
    int i;
    int previous = 0;
    int id;
    for (i = 0; i <= 4; i++) {
        struct Slot *slot = (struct Slot *)((char *)&data_ov002_022cf16c[(1 - p->player) & 1] + i * 0x14);
        id = slot->id;
        if (id && slot->active && previous != func_0202b890(id) && (int)func_0202b890(id) <= 6) {
            if (previous != 0) return 1;
            previous = func_0202b890(id);
        }
    }
    return 0;
}




