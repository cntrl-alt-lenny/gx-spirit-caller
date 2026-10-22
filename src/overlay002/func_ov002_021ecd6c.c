struct self_t { char pad[4]; unsigned short low:6; unsigned short value:9; unsigned short high:1; };
struct subrow { char pad[0x30]; unsigned int id:13; unsigned int flag:1; unsigned int mid:8; unsigned int value:8; unsigned int high:2; };
struct slot_t { unsigned int id:13; unsigned int flag:1; unsigned int mid:8; unsigned int value:8; unsigned int high:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern unsigned int func_0202b878(int id);
int func_ov002_021ecd6c(struct self_t *self, int player, int idx) {
    int row, col, id; unsigned int slot;
    if (idx < 5 || idx > 10) return 0;
    player &= 1;
    player *= 0x868;
    row = player;
    idx *= 20;
    col = idx;
    slot = (unsigned int)(data_ov002_022cf16c + row);
    slot += col;
    id = ((struct subrow *)slot)->id;
    if (id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + col) == 0) return 0;
    if (func_0202b878(id) == 23) return 0;

    return self->value != (((struct slot_t *)(data_ov002_022cf16c + row + 0x30 + col))->value * 2 + ((struct slot_t *)(data_ov002_022cf16c + row + 0x30 + col))->flag);
}






