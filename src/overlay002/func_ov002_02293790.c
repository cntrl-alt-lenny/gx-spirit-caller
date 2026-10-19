typedef unsigned short u16;
typedef struct { u16 id; u16 side:1; u16 rest:15; int fields[5]; } Card;
typedef struct { int id; int (*test)(Card *, int); } Entry;
extern unsigned int func_0202b878(int id);
extern int func_ov002_021c2f24(int side, int id);
extern int func_ov002_021fc3e8(Card *card, int arg);
extern char data_ov002_022cf16c[];
extern Entry data_ov002_022c9508[];
extern int data_ov002_022cd524[];
int func_ov002_02293790(Card *self) {
    Card copy = *self;
    int i = 0;
    if (*(int *)(data_ov002_022cf16c + (self->side & 1) * 0x868) <= 0x7d0) return 0;
    do {
        copy.id = data_ov002_022c9508[i].id;
        if (func_0202b878(copy.id) == 0x16 &&
            func_ov002_021c2f24(1 - self->side, copy.id) != 0 &&
            data_ov002_022c9508[i].test(&copy, 0) != 0 &&
            func_ov002_021fc3e8(&copy, 0) != 0) {
            data_ov002_022cd524[4] = copy.id;
            return 1;
        }
        i++;
    } while (data_ov002_022c9508[i].id != 0x1379);
    return 0;
}
