typedef struct { unsigned short f0; unsigned short bit:1; unsigned short pad:5; unsigned short kind:6; unsigned short rest:4; } Card021c1e44;
extern int func_0202eac8(int);
extern int func_ov002_021bc000(int player, int (*fn)(int));
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern struct { int player; char pad[24]; int index; char pad2[8]; int value; } data_ov002_022cd3f4;
struct Slot { unsigned id:13; unsigned flag:1; unsigned pad:8; unsigned value:8; unsigned rest:2; char extra[16]; };
int func_ov002_02234350(Card021c1e44 *self) {
    if ((unsigned short)(self->kind + 0xffee) <= 1 && func_ov002_021bc000(self->bit, func_0202eac8)) {
        unsigned flags = *(unsigned *)(data_ov002_022d016c + 0xd0);
        if ((~flags & (flags >> 1)) & 1) {
            int player = data_ov002_022cd3f4.player;
            int index = data_ov002_022cd3f4.index;
            int offset = (player & 1) * 0x868;
            int entry = index * 0x14;
            struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + offset + 0x30 + entry);
            if (data_ov002_022cd3f4.value == slot->value * 2 + slot->flag &&
                *(unsigned short *)(data_ov002_022cf1a4 + offset + entry) != 0 &&
                func_ov002_021c1e44(self, player, index) == 0) {
                func_ov002_021d479c((data_ov002_022cd3f4.player ? 0x8000 : 0) | 0x20, data_ov002_022cd3f4.index, 0, 0);
                return 0;
            }
        }
    }
    func_ov002_021e276c((void *)self->bit, self->f0, 1, 0);
    return 0;
}


