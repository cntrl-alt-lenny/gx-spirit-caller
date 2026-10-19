struct Self { unsigned short f0; unsigned short bit:1; unsigned short rest:15; };
struct Card { unsigned int id:13; unsigned int rest:19; };
struct Table { char pad[12]; unsigned int count; char pad2[272]; struct Card cards[466]; };
struct State { char pad[0x5a8]; int state; int step; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022d016c[];
extern unsigned int data_ov002_022cf178[];
extern struct Table data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern int func_ov002_021e27c0(int self_thing, int arg1);
int func_ov002_02225cec(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021e27c0(self->bit, 1);
        func_ov002_021e27c0(1-self->bit, 1);
        data_ov002_022ce288.step=0;
        return 0x7f;
    case 0x7f: {
        unsigned int i;
        unsigned int side = *(unsigned int *)(data_ov002_022d016c+0xcec) ^ data_ov002_022ce288.step;
        i=0; if (i < *(unsigned int *)((char *)data_ov002_022cf178 + (side&1)*0x868)) { do {
            if(func_0202e234(data_ov002_022cf16c[side&1].cards[i].id))
                func_ov002_021d7970((void *)side, i, side != self->bit ? 1 : 0);
            ++i;
        } while (i < data_ov002_022cf16c[side&1].count); }
        ++data_ov002_022ce288.step;
        return data_ov002_022ce288.step < 2 ? 0x7f : 0x7e;
    }
    case 0x7e:
        func_ov002_021e27c0(self->bit, 0);
        func_ov002_021e27c0(1-self->bit, 0);
        return 0;
    }
    return 0;
}


