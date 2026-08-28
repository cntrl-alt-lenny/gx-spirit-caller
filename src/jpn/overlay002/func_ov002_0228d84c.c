/* func_ov002_0228d84c: read cf1a4 u16 and cf16c slot id at (player,idx). If
 * the u16 is nonzero and id==0x118a, return 3. Guard func_0202e2a4(id)!=0
 * -> 2. Else return func_ov002_0227d310(id)!=0. */
struct Ov002Slot {
    unsigned int id : 13;
};

extern char data_ov002_022cf08c[];
extern char data_ov002_022cf0c4[];
extern int func_0202e2a4(int id);
extern int func_ov002_0227d310(int id);

int func_ov002_0228d84c(int player, int idx) {
    int poff = (player & 1) * 0x868;
    int ioff = idx * 20;
    struct Ov002Slot *slot = (struct Ov002Slot *)(data_ov002_022cf08c + poff + 0x30 + ioff);
    unsigned int id = slot->id;
    if (*(unsigned short *)(data_ov002_022cf0c4 + poff + ioff) != 0) {
        if (id == 0x118a)
            return 3;
    }
    if (func_0202e2a4(id) != 0)
        return 2;
    return func_ov002_0227d310(id) != 0;
}
