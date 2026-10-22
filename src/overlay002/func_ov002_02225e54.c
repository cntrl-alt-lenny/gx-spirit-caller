typedef unsigned short u16;
struct Self { u16 id; u16 bit:1; u16 rest:15; };
struct Card { unsigned int id:13; unsigned int rest:19; };
struct Side { int value; char pad[0x25c]; struct Card card; char tail[0x604]; };
struct Slot { int value; char pad[0x864]; };
extern struct Side data_ov002_022cf16c[];
extern struct Slot data_ov002_022cf17c[];
extern int data_ov002_022cd744[];
extern struct { char pad[0x5a8]; int state; int step; } data_ov002_022ce288;
extern struct { char pad[0xd44]; int choice; } data_ov002_022d016c;
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern void func_ov002_021ae514(int a, int b, int c, int d, int e, int f);
extern int func_ov002_021c988c(int player, int kind, int extra);
extern void func_ov002_021d87dc(int arg0);
extern void func_ov002_021df73c(int arg0, int arg1);
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0226b0d0(int arg0, int arg1, int arg2);
int func_ov002_02225e54(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (data_ov002_022cf17c[self->bit & 1].value == 0) return 0;
        if (data_ov002_022cd744[self->bit] == 1)
            data_ov002_022d016c.choice = 0;
        else
            func_ov002_021ae514(0x104, 0x1b8, 0x1b9, 0x1ba, 0, 15);
        return 0x7f;
    case 0x7f:
        data_ov002_022ce288.step = data_ov002_022d016c.choice;
        func_ov002_0226b0d0(1-self->bit, self->id, data_ov002_022d016c.choice);
        return 0x7e;
    case 0x7e:
        if (func_ov002_021c988c(self->bit, 13, 0) == 0) {
            func_ov002_021e2818(self->bit);
            func_ov002_021d87dc(self->bit);
            func_ov002_021e2818(self->bit);
        }
        return 0x7d;
    case 0x7d: {
        int id = data_ov002_022cf16c[self->bit & 1].card.id;
        switch (data_ov002_022ce288.step) {
        case 0: if (!func_0202e234(id)) return 0x64; break;
        case 1: if (func_0202b878(id) != 0x16) return 0x64; break;
        case 2: if (func_0202b878(id) != 0x17) return 0x64; break;
        }
        func_ov002_021df73c(self->bit, data_ov002_022cf16c[(1-self->bit)&1].value);
        func_ov002_021df73c(1-self->bit, data_ov002_022cf16c[self->bit&1].value);
        return 0x64;
    }
    case 0x64:
        func_ov002_021e286c(self->bit);
        return 0;
    }
    return 0;
}
