typedef struct {
    unsigned int val : 13;
    unsigned int rest : 19;
} Bits;

typedef struct {
    unsigned short id;
    unsigned short flag : 1;
    unsigned short rest : 15;
} Card;

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1a2c(int player, int idx, int id);
extern int func_ov002_021c1e44(void *self, int player, int idx);
extern int func_ov002_021c1ef0(void *self, int player, int idx);

int func_ov002_021f21f8(Card *self, int player, int idx) {
    int off;
    int o2;
    if (self->flag != player)
        return 0;
    if (idx >= 5)
        return 0;
    off = (player & 1) * 0x868;
    o2 = idx * 0x14;
    if (((Bits *)(data_ov002_022cf16c + off + 0x30 + o2))->val == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1a2c(player, idx, self->id) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (*(int *)(data_ov002_022ce288 + 0x5c0) == 0) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + off + o2) == 0)
            return 0;
    }
    return 1;
}
