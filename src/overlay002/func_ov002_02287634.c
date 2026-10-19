typedef unsigned short u16;
struct Self { u16 f0; u16 bit0:1; u16 rest:15; };
struct Card { unsigned int id:13; unsigned int rest:19; int f4; u16 f8; char pad[10]; };
struct Row { int value; char pad[44]; struct Card cards[5]; char tail[2004]; };
extern struct Row data_ov002_022cf16c[];
extern int func_0202e270(int unused0);
extern int func_0202f9e8(int id);
int func_ov002_02287634(struct Self *self) {
    int i, j;
    int count = 0;
    for (i = 0; i < 2; i++) {
        struct Card *p = data_ov002_022cf16c[i & 1].cards;
        for (j = 0; j < 5; j++, p++) {
            if (p->id != 0) {
                if (func_0202e270(p->id) != 0) count++;
            }
        }
    }
    if (data_ov002_022cf16c[(1 - self->bit0) & 1].value <= count * 500) return 1;
    { count = 0;
    for (j = 0; j < 5; j++) {
        struct Row *p = (struct Row *)((char *)&data_ov002_022cf16c[(1 - self->bit0) & 1] + j * 20);
        if (p->cards[0].id != 0 && p->cards[0].f8 == 0) count++;
        { struct Row *q = (struct Row *)((char *)&data_ov002_022cf16c[self->bit0 & 1] + j * 20);
        if (q->cards[0].id != 0 && q->cards[0].f8 == 0) {
            if (func_0202f9e8(q->cards[0].id) != 0) return 0;
        }
    }
    } if (count <= 0) return 0; return 1; }
}













