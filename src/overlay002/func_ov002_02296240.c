struct Entity {
    unsigned short id;
    unsigned short player : 1;
    unsigned short slot : 5;
    unsigned short rest : 10;
};
extern int func_ov002_02259f74(int x);
extern int func_ov002_021be4a0(int player, int slot, int flag);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bbf50(int arg0);
extern char data_ov002_022cf16c[];

int func_ov002_02296240(struct Entity *self) {
    if (func_ov002_02259f74(self->player) == 0) return 0;
    if (func_ov002_021be4a0(self->player, self->slot, 1) == 0) return 0;
    if (func_ov002_021bb068(0x17a6) != 0) return 0;
    if (func_ov002_021bbf50(1 - self->player) == 0) return 0;
    return *(int *)(data_ov002_022cf16c + ((1 - self->player) & 1) * 0x868) < 0x7d0;
}
