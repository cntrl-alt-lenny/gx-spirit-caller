struct State {
    unsigned char pad[0x484];
    int active;
    int pad488;
    unsigned short *card;
};
struct Entry { unsigned id:13; unsigned rest:19; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf180[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224ff28(int player) {
    unsigned char indices[80];
    void *previous;
    int i;
    int id;
    int count;
    struct Entry *row;
    char *base;
    count = 0;
    if (data_ov002_022ce288.active != 0)
        previous = (char *)data_ov002_022ce288.card - 0x18;
    else
        previous = 0;
    i = 0;
    if (*(unsigned int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) > i) {
        row = (struct Entry *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x418);
        base = data_ov002_022cf16c + (player & 1) * 0x868;
        do {
            id = row[i].id;
            if (func_0202b878(id) == 0x17 && func_0202b8c0(id) == 0) {
                *data_ov002_022ce288.card = id;
                if (func_ov002_02257b48(data_ov002_022ce288.card, previous) != 0) {
                    indices[count++] = i;
                }
            }
            i++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
    for (i = 0; i < count; i++) {
        func_ov002_02253458(player, 14, indices[i]);
    }
    *data_ov002_022ce288.card = 0x1935;
}










