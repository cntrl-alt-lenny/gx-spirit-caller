extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_0202b950(int unused0);
extern int func_0202e234(int x);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Entry {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int slot:8;
    unsigned int rest:2;
};
void func_ov002_02250234(int player, int card) {
    int off = (player & 1) * 0x868;
    unsigned int i = 0;
    if (*(unsigned int *)((char *)data_ov002_022cf17c + off) > i) {
        int id;
        struct Entry *e = (struct Entry *)(data_ov002_022cf16c + off + 0x260);
        char *base = data_ov002_022cf16c + off;
        do {
            id = e->id;
            if (func_0202e234(id) != 0 &&
                func_0202b950(id) <= 0x5dc &&
                func_0202b890(id) == func_0202b890(card) &&
                func_0202b878(id) == func_0202b878(card) &&
                func_ov002_021ca440(player, id) != 0 &&
                func_ov002_021b3fd8(player, 11, 0x12a1, e->slot * 2 + e->flag) == 0) {
                func_ov002_02253458(player, 13, i);
            }
            i++;
            e++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
}


