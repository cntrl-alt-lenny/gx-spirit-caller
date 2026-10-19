typedef unsigned short u16;
typedef struct { unsigned int id:13; unsigned int side:1; unsigned int unused:8; unsigned int index:8; unsigned int rest:2; unsigned int tail[4]; } Obj;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 :10; } Card021c1e44;
typedef struct S { int pad0[2]; int f8; int fc; int f10; int pad14[8]; int f34; } S;
extern int func_ov002_021ba0b0(Obj *p);
extern int func_0202e2f8(int unused0);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021badb0(S *p);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern void func_ov002_021dcc48(Obj *, int, int, int);
extern int data_ov002_022cd3f4[];
extern Obj data_ov002_022cd4b8[];
extern S data_ov002_022cd420[];
int func_ov002_021df130(Card021c1e44 *card, int idx, int flags) {
    int side = idx == 0 ? data_ov002_022cd3f4[0] : data_ov002_022cd3f4[1];
    int pos = idx == 0 ? data_ov002_022cd3f4[7] : data_ov002_022cd3f4[8];
    int id = func_ov002_021ba0b0(&data_ov002_022cd4b8[idx]);
    int packed = data_ov002_022cd4b8[idx].index * 2 + data_ov002_022cd4b8[idx].side;
    if (func_ov002_021c1e44(card, side, pos) != 0) return 0;
    if (id == 0x1a8d) {
        if (func_ov002_021badb0(&data_ov002_022cd420[data_ov002_022cd3f4[0] ^ idx]) != 0) return 0;
    }
    if (id != 0) {
        if (func_0202e2f8(id) != 0) {
            func_ov002_021d479c((u16)((side ? 0x8000 : 0) | 0x31), (u16)((pos & 0xff) | 0xff00), 0x10, (u16)packed);
        } else {
            if (card->flag0 != side) flags |= 1;
            func_ov002_021d479c((u16)((side ? 0x8000 : 0) | 0x33), (u16)((pos & 0xff) | 0xff00), (u16)flags, (u16)packed);
        }
        func_ov002_021dcc48(&data_ov002_022cd4b8[idx], side, pos, flags);
        return 1;
    }
    return 0;
}
