typedef struct {
    unsigned short id;
    unsigned short player : 1;
    unsigned short pad : 5;
    unsigned short kind : 6;
    unsigned short rest : 4;
} Self;
extern char data_ov002_022cf1a4[];
extern int func_0202e864(int id);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc8c8(int a, int b, int c);
int func_ov002_021ebc2c(Self *self, int player, int idx) {
    if (self->kind == 0x23) return 1;
    if (func_ov002_021bc8c8(self->player, player, idx) == 0) return 0;
    int off = idx * 0x14;
    int poff = (player & 1) * 0x868;
    char *row = data_ov002_022cf1a4 + poff;
    if (*(unsigned short *)(off + row) == 0) return 0;
    if (func_ov002_021bc618(self->player) == 0) {
        if (self->player != player) return 0;
        if (func_ov002_021bc288(player, idx) == 0) return 0;
    }
    switch (self->id) {
    case 0x12c5: return func_ov002_021ba104(player, idx, 0xfe0);
    case 0x167d: return func_ov002_021ba104(player, idx, 0xfc9);
    case 0x1768: return func_0202e864(func_ov002_021b9ecc(player, idx));
    default: return 1;
    }
}


