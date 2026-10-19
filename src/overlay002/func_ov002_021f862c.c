typedef unsigned short u16;
struct Obj { u16 id; u16 side:1; u16 rest:15; };
struct State { char pad[0x5b4]; int step; };
struct Pending { char pad[0xd70]; int side; int unused; int index; };
struct Card { unsigned int low:13; unsigned int bit:1; unsigned int mid:8; unsigned int value:8; unsigned int high:2; };
struct Player { char pad[0x120]; struct Card cards[0x1d2]; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct Pending data_ov002_022d016c;
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021f4a84(struct Obj *, int);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_022107b4(int a, int b, int c);
extern void func_ov002_02290500(int, int, int (*)(int,int,int));
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_021e278c(int arg0, int arg1);
extern void func_ov002_021d71e0(int,int,int);
int func_ov002_021f862c(struct Obj *self, int arg) {
    switch (data_ov002_022ce288.step) {
    default: {
        int result = func_ov002_021f4a84(self, arg);
        if (result != 1) return result;
        data_ov002_022ce288.step = 10;
        return 0;
    }
    case 10:
        func_ov002_021ae400(self->side, 0x4c);
        if (data_ov002_022cd744[self->side] == 1)
            func_ov002_02290500(self->side, 2, func_ov002_022107b4);
        else
            func_ov002_022592ec((int)func_ov002_022107b4);
        data_ov002_022ce288.step++;
        return 0;
    case 11:
        if (func_ov002_022593f4() != 0) {
            int side = data_ov002_022d016c.side;
            int index = data_ov002_022d016c.index;
            struct Player *player = &data_ov002_022cf16c[side & 1];
            struct Card *card = &player->cards[index];
            func_ov002_021e278c(side, card->value * 2 + card->bit);
            func_ov002_021d71e0(side, index, 0);
            return 1;
        }
        data_ov002_022ce288.step--;
        return 0;
    }
}

