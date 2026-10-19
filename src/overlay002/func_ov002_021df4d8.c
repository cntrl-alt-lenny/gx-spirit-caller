typedef unsigned short u16;
typedef struct { unsigned int id:13; unsigned int side:1; unsigned int unused:8; unsigned int index:8; unsigned int rest:2; unsigned int tail[4]; } Obj;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 :10; } Card021c1e44;
extern int func_ov002_021ba0b0(Obj *p);
extern int func_0202e2f8(int unused0);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern void func_ov002_021dcc48(Obj *, int, int, int);
extern int data_ov002_022cd3f4[];
extern Obj data_ov002_022cd4b8[];
int func_ov002_021df4d8(Card021c1e44 *card, int idx) {
    unsigned long flags = 0;
    int side = idx == 0 ? data_ov002_022cd3f4[0] : data_ov002_022cd3f4[1];
    int pos = idx == 0 ? data_ov002_022cd3f4[7] : data_ov002_022cd3f4[8];
    int id = func_ov002_021ba0b0(&data_ov002_022cd4b8[idx]);
    int packed = data_ov002_022cd4b8[idx].index * 2 + data_ov002_022cd4b8[idx].side;
    if (func_ov002_021c1e44(card, side, pos) != 0) return 0;
    if (id != 0) {
        if (func_0202e2f8(id) != 0) {
            func_ov002_021d479c((u16)((side ? 0x8000 : 0) | 0x31), (u16)((pos & 0xff) | 0xff00), 0x10, (u16)packed);
        } else {
            int owner = card->flag0;
            int bit = data_ov002_022cd4b8[idx].side;
            if (owner != side) flags |= 1;
            func_ov002_021d479c(0x40, (u16)((side & 1) | ((pos & 0x1f) << 1) | 0xffc0), (u16)((bit & 1) | 0x5a), (u16)flags);
        }
        func_ov002_021dcc48(&data_ov002_022cd4b8[idx], side, pos, flags);
        return 1;
    }
    return 0;
}




