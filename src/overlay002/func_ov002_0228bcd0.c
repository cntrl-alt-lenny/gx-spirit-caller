typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1; u16 pad4:6, code:9, rest4:1; char pad[14]; u32 value; } Card;
struct Card97050;
typedef struct { u16 side:1; u16 rest:15; char pad[22]; } Flag;
typedef struct { int id; int (*test)(Card *, Card *); } Request;
typedef struct { u32 id:13, bit13:1, rest:8, byte22:8, end:2; char pad[16]; } Row;
extern char data_ov002_022ce288[];
extern char data_ov002_022ce58a[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0203158c(int x);
extern int func_ov002_021b9ecc(int side, int zone);
extern int func_ov002_021c3ae4(int arg0, int arg1);
extern int func_ov002_021c3b60(int player, int arg1);
extern int func_ov002_021fc1a0(Card *self, Card *other);
extern int func_ov002_021fc3e8(Card *self, Card *other);
extern void func_ov002_02259774(int bit0, int val5, int val8, int flag);
extern int func_ov002_022819d4(int arg0);
extern int func_ov002_02297050(struct Card97050 *card);
int func_ov002_0228bcd0(int side, Request *req, Card *other) {
    int id = req->id;
    int i, j, player, index;
    if (func_0202b878(id) == 23) {
        Flag *flag;
        char *p = data_ov002_022ce288;
        int count = *(int *)(p + 0x480);
        i = 0;
        if (count > 0) {
          flag = (Flag *)data_ov002_022ce58a;
          do {
            if (side == flag->side && id == *(u16 *)(p + 0x300)) return 0;
            i++; flag++; p += 24;
          } while (i < count);
        }
        if (func_0202b8c0(id) == 4 && func_ov002_021c3ae4(side, 0x19a3)) {
            int k = 5;
            char *base = data_ov002_022cf16c + (side & 1) * 0x868 + 0x64;
            Row *row = (Row *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x94);
            for (; k < 10; k++, base += 20, row++) {
                if (id == func_ov002_021b9ecc(side, k) && *(u16 *)(base + 0x38) == 0) {
                    Card card = {0};
                    card.id = (u16)id;
                    card.side = (u16)side;
                    card.zone = (u16)k;
                    card.code = (u16)(row->bit13 + (row->byte22 << 1));
                    card.flip = 0;
                    if (func_ov002_021fc3e8(&card, other)) {
                        *(int *)(data_ov002_022d016c + 0xd6c) = side;
                        func_ov002_02259774(side, k, 0, 3);
                        return 1;
                    }
                }
            }
        }
    }
    for (j = 0; j < 2; j++) {
        char *base;
        Row *row;
        player = side ^ j;
        base = data_ov002_022cf16c + (player & 1) * 0x868;
        row = (Row *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        for (i = 0; i <= 10; base += 20, row++, i++) {
            if (id == func_ov002_021b9ecc(player, i)) {
                if (player == side || (func_0203158c(id) && *(u16 *)(base + 0x38))) {
                    Card card = {0};
                    int valid;
                    card.id = (u16)id;
                    card.side = (u16)player;
                    card.zone = (u16)i;
                    card.code = (u16)(row->bit13 + (row->byte22 << 1));
                    card.flip = player != side;
                    if (*(u16 *)(base + 0x38)) valid = func_ov002_021fc1a0(&card, other);
                    else valid = func_ov002_021fc3e8(&card, other);
                    if (valid && !func_ov002_02297050((struct Card97050 *)&card) && req->test(&card, other)) {
                        *(int *)(data_ov002_022d016c + 0xd6c) = side;
                        func_ov002_02259774(player, i, 0, 3);
                        return 1;
                    }
                }
            }
        }
    }
    index = func_ov002_021c3b60(side, req->id);
    if (index >= 0 && func_ov002_022819d4(side)) {
        Row *row = (Row *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x120 + index * 4);
        Card card = {0};
        card.id = id;
        card.side = (u16)side;
        card.zone = 11;
        card.code = (u16)(row->bit13 + (row->byte22 << 1));
        if (func_ov002_021fc3e8(&card, other) && !func_ov002_02297050((struct Card97050 *)&card) && req->test(&card, other)) {
            *(int *)(data_ov002_022d016c + 0xd6c) = side;
            func_ov002_02259774(side, 11, index, 3);
            return 1;
        }
    }
    return 0;
}



