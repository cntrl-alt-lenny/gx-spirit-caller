typedef unsigned short u16;
struct Node0223def4 {
    u16 pad0;
    u16 player:1;
    u16 pad2:15;
    u16 pad4;
    u16 low:8;
    u16 count:8;
    u16 arr8[5];
    u16 f18;
};
typedef struct {
    unsigned int pad2:13;
    unsigned int lo:1;
    unsigned int pad1:8;
    unsigned int hi:8;
    unsigned int pad0:2;
} Entry;
extern char data_ov002_022cf16c[];
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021d7268(int player, int id, int flag);
extern int func_ov002_021e286c(int arg0);
int func_ov002_022222d8(struct Node0223def4 *self) {
    if (self->count) {
        int id = func_ov002_0223def4(self, self->count - 1);
        int index = func_ov002_021b99b4(1 - self->player, id);
        if (index >= 0) {
            int player = 1 - self->player;
            Entry *p = (Entry *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x418);
            func_ov002_021d7268(player, p[index].hi * 2 + p[index].lo, 1);
        }
        self->count = (u16)(self->count + 0xffff);
        return 0x80;
    }
    func_ov002_021e286c(1 - self->player);
    return 0;
}

