typedef struct { unsigned short id; unsigned short side : 1; } Card;
typedef struct {
    char pad[0x30];
    unsigned int id : 13;
    unsigned int rest : 19;
    unsigned short h34, h36;
} Row;
extern char data_ov002_022cf16c[];
extern int func_ov002_02259f74(int x);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern void func_ov002_021c4c9c(int a, int b, int *out);
int func_ov002_02293c28(Card *self) {
    int out[11];
    int limit = 0;
    int i;
    if (func_ov002_02259f74(self->side) == 0) return 0;
    for (i = 0; i < 5; i++) {
        Row *row = (Row *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + i * 0x14);
        if (row->id != 0 && row->h36 == 0) {
            limit = limit > func_ov002_021c8470(self->side, i) ? limit : func_ov002_021c8470(self->side, i);
        }
    }
    for (i = 0; i < 5; i++) {
        if (func_ov002_022575c8((int)self, 1 - self->side, i) != 0) {
            func_ov002_021c4c9c(1 - self->side, i, out);
            if (((Row *)(data_ov002_022cf16c + ((1 - self->side) & 1) * 0x868 + i * 0x14))->h36 == 0) {
                if (out[5] >= limit && out[6] < limit) return 1;
            } else {
                if (out[6] >= limit && out[5] < limit) return 1;
            }
        }
    }
    return 0;
}

