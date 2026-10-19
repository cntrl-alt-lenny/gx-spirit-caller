struct self_t { char pad[2]; unsigned short b0:1; unsigned short rest:15; };
struct subrow { char pad[0x30]; unsigned int id:13; unsigned int rest:19; };
struct entry { unsigned int low:9; unsigned int player:1; unsigned int idx:4; unsigned int flag14:1; unsigned int flag15:1; unsigned int high:16; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022ce288[];
extern struct entry data_ov002_022ce884[];
extern int func_ov002_021c1ef0(struct self_t *, int, int);
int func_ov002_021ecf60(struct self_t *self, int player, int idx) {
    int row = (player & 1) * 0x868;
    int col = idx * 20;
    unsigned int i;
    char *p;
    struct entry *e;
    unsigned int count;
    unsigned int slot;
    slot = (unsigned int)(data_ov002_022cf16c + row);
    slot += col;
    if (((struct subrow *)slot)->id == 0) return 0;
    if (player == self->b0) return 0;
    if (idx >= 5) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + col) != 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a2 + row + col) == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    i = 0;
    p = data_ov002_022ce288;
    count = *(unsigned int *)(p + 0x5d4);
    if (i < count) {
    e = data_ov002_022ce884;
    do {
        if ((unsigned char)(*(unsigned char *)(p + 0x5dc) + 0xf8) <= 1) {
            if (player == e->player && idx == e->idx && !e->flag15 && e->flag14) return 1;
        }
        i++; p++; e++;
    } while (i < count);
    }
    return 0;
}




