typedef unsigned short u16;
typedef unsigned char u8;
struct Ov002Self;
extern int func_ov002_021ae664(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021d5a08(struct Ov002Self *, int, int, int, u16, u16);
extern void func_ov002_0226b22c(int, int, int, int);
extern char data_ov002_022cf16c[];
extern char data_ov002_022ce288[];
extern int data_ov002_022cd3f4[];
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
struct Input {
    u16 a;
    u16 player:1, slot:5, kind:6, rest:4;
    u16 b:2, blocked:1, c:3, id:9, d:1;
    char pad[14];
    int value;
};
struct Card { unsigned int a:13, flag:1, b:8, id:8, c:2; };
int func_ov002_0221c7f0(struct Input *self) {
    unsigned int slot, player;
    if (self->blocked) return 0;
    slot = self->slot;
    player = self->player;
    if (self->id != (((struct Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + slot * 20))->id * 2 + ((struct Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + slot * 20))->flag)) return 0;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (self->kind != 0x12) return 0;
        if (self->value == 0) return 0;
        if (data_ov002_022cd3f4[0] == player) return 0;
        if (data_ov002_022cd744[player] == 1) {
            *(unsigned int *)(data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    case 0x7f:
        func_ov002_0226b22c(player, slot, 1, *(int *)(data_ov002_022d016c + 0xd44));
        return 0x7e;
    case 0x7e:
        if (*(u16 *)(data_ov002_022d0e6c + 0xb2)) {
            func_ov002_021d5a08((struct Ov002Self *)self, data_ov002_022cd3f4[0], data_ov002_022cd3f4[7], (u16)((u8)player | ((u8)slot << 8)), 7, 0);
        }
        return 0xa;
    default:
        return 0;
    }
}



