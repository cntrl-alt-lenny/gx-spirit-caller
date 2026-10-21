typedef unsigned short u16;
struct Node0223def4 {
    u16 id;
    u16 player : 1;
    u16 rest : 15;
    u16 f4;
    u16 low : 8;
    u16 kind : 8;
    u16 arr8[5];
    u16 f18;
};
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021d7268(int player, int id, int flag);
int func_ov002_0222d1a0(struct Node0223def4 *self) {
    int id;
    if (self->kind == 1) {
        id = func_ov002_0223def4(self, 0);
        if (func_ov002_021b99b4(self->player, id) >= 0) {
            switch (self->id) {
            case 0x16d5:
                func_ov002_021d7268(self->player, id, 0);
                break;
            default:
                func_ov002_021d7268(self->player, id, 1);
            }
        }
    }
    return 0;
}


