typedef struct { unsigned short id; unsigned short bit : 1; unsigned short row : 5; } Self;
struct Global { char pad[0x5a8]; int state; };
struct Card { unsigned id : 13; unsigned rest : 19; };
struct Player { char pad[0x120]; struct Card cards[1]; char pad2[0x868 - 0x124]; };
struct Idx { char pad[0xb0]; unsigned short idx; };
extern struct Global data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern struct Idx data_ov002_022d0e6c;
extern unsigned int func_0202b890(int id);
extern int func_ov002_021c3bdc(int idx);
extern void func_ov002_021d7b44(int player, void *card, int flag);
extern int func_ov002_021d90c0(int a, int b, int c);
extern int func_ov002_021e27c0(int a, int b);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern void func_ov002_0226b094(int a, int b);

int func_ov002_022377f0(Self *self) {
    int i;
    int attr;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021c3bdc(self->bit) == 0) {
            func_ov002_021e27c0(self->bit, 1);
            return 0x78;
        }
        func_ov002_0226afb4(self->bit, self->id);
        return 0x7f;
    case 0x7f:
        i = data_ov002_022d0e6c.idx;
        attr = func_0202b890(((struct Card *)((char *)&data_ov002_022cf16c[self->bit & 1] + 0x120))[i].id);
        func_ov002_021d7b44(self->bit, (char *)&data_ov002_022cf16c[self->bit & 1] + 0x120 + i * 4, 0);
        func_ov002_021d90c0(self->bit, self->row, attr);
        return 0;
    case 0x78:
        func_ov002_0226b094(1 - self->bit, self->id);
        return 0x77;
    case 0x77:
        func_ov002_021e27c0(self->bit, 0);
        return 0;
    }
    return 0;
}
