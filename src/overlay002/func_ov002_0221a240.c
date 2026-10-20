typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 id;
    u16 player : 1;
    u16 rest : 15;
    u16 pad : 2;
    u16 disabled : 1;
    u16 rest4 : 13;
} Obj;
extern char data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern int func_ov002_021ae484(int x);
extern int func_ov002_021c9c48(int arg0);
extern int func_ov002_021e25f0(int player, int index, int flag);
extern int func_ov002_0220e518(void *self);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern void func_ov002_0226afb4(int arg0, int arg1);
int func_ov002_0221a240(Obj *self) {
    u32 i;
    int found;
    if (self->disabled) return 0;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        return func_ov002_0220e518(self) ? 0x7f : 0;
    case 0x7f:
        if (*(u32 *)(data_ov002_022cf178 + (self->player & 1) * 0x868) == 0) return 0;
        if (func_ov002_021c9c48(self->player) == 0) return 0;
        found = 0;
        i = 0;
        if (i < *(u32 *)(data_ov002_022cf178 + (self->player & 1) * 0x868)) do {
            if (func_ov002_022536e8(self->player, self->id, i) != 0) {
                found = 1;
                break;
            }
            i++;
        } while (i < *(u32 *)(data_ov002_022cf16c + (self->player & 1) * 0x868 + 0xc));
        if (!found) return 0;
        if (data_ov002_022cd744[self->player] == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = 0;
        } else {
            func_ov002_021ae484(0x2d);
        }
        return 0x7e;
    case 0x7e:
        if (*(int *)(data_ov002_022d016c + 0xd44) == 0) return 0;
        func_ov002_0226afb4(self->player, self->id);
        return 0x7d;
    case 0x7d:
        func_ov002_021e25f0(self->player, *(u16 *)(data_ov002_022d0e6c + 0xb0), 0);
        return 0;
    }
    return 0;
}


