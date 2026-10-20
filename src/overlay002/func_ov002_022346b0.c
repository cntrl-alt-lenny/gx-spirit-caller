typedef unsigned short u16;
struct Node0223def4 {
    u16 f0;
    u16 player:1; u16 rest2:15;
    u16 f4;
    u16 low6:8; u16 count:8;
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
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021d7268(int player, int id, int flag);
extern int func_ov002_021e286c(int arg0);
/* This caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021e104c();
int func_ov002_022346b0(struct Node0223def4 *self) {
    int i;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        for (i = 0; i < self->count; i++) {
            if (func_ov002_021b99b4(self->player, func_ov002_0223def4(self, i)) < 0)
                return 0;
        }
        return 0x7f;
    case 0x7f:
        if (self->count) {
            i = func_ov002_021b99b4(self->player, func_ov002_0223def4(self, self->count - 1));
            if (i >= 0) {
                Entry *p = (Entry *)(data_ov002_022cf16c + (self->player & 1) * 0x868 + 0x418);
                func_ov002_021d7268(self->player, p[i].hi * 2 + p[i].lo, 1);
            }
            self->count = (u16)(self->count + 0xffff);
            return 0x7f;
        }
        return 0x7e;
    case 0x7e:
        func_ov002_021e286c(self->player);
        return 0x7d;
    case 0x7d:
        func_ov002_021e104c(self->player, 2);
        return 0;
    }
    return 0;
}

