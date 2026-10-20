struct self_t { char pad[2]; unsigned short b0:1; unsigned short rest:15; };
struct subrow { char pad[0x30]; unsigned int id:13; unsigned int rest:19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(struct self_t *, int, int);
extern int func_0202e2c8(int unused0);
int func_ov002_021ece34(struct self_t *self, int player, int idx) {
    int row = (player & 1) * 0x868;
    int col = idx * 20;
    unsigned int slot = (unsigned int)(data_ov002_022cf16c + row);
    int id;
    slot += col;
    id = ((struct subrow *)slot)->id;
    if (idx >= 5) return 0;
    if (id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + col) == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    return func_0202e2c8(id) != 0;
}

