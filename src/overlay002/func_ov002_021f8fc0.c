typedef unsigned short u16;
typedef unsigned int u32;
struct F021f4a4c_F2 { u16 bit0:1; u16 fld5:5; u16 rest:10; };
struct F021f4a4c_Self { u16 pad0; struct F021f4a4c_F2 f2; };
struct Obj { u16 id; u16 side:1; u16 pad:5; u16 tag:6; u16 top:4; u16 other[4]; u16 result; };
struct State { char pad[0x5b4]; int step; };
struct Pending { char pad[0xd70]; void *side; int unused; int index; };
struct Card { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; };
struct Player { char pad[0x120]; struct Card cards[0x1d2]; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct Pending data_ov002_022d016c;
extern struct Player data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_022107b4(int a, int b, int c);
extern void func_ov002_02290500(int, int, int (*)(int,int,int));
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_021d7a1c(void *arg0, int arg1);
extern int func_ov002_021c38c4(void *, int);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021f4a4c(struct F021f4a4c_Self *self, int unused1);
int func_ov002_021f8fc0(struct Obj *self, int arg) {
    switch (data_ov002_022ce288.step) {
    case 0:
        if (self->tag == 0x23) {
            data_ov002_022ce288.step = 2;
            return 0;
        }
        func_ov002_021ae400(self->side, 0x29);
        if (data_ov002_022cd744[self->side] == 1)
            func_ov002_02290500(self->side, 2, func_ov002_022107b4);
        else
            func_ov002_022592ec((int)func_ov002_022107b4);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if (func_ov002_022593f4() != 0) {
            void *side = data_ov002_022d016c.side;
            int index = data_ov002_022d016c.index;
            func_ov002_021d7a1c(side, index);
            if (self->id != 0x1895) {
                if (self->id == 0x18cb) {
                    struct Card *card = &data_ov002_022cf16c[(u32)side & 1].cards[index];
                    self->result = func_ov002_021c38c4(side, card->value * 2 + card->bit);
                }
            } else {
                self->result = func_0202b8a8(data_ov002_022cf16c[(u32)side & 1].cards[index].id);
            }
            data_ov002_022ce288.step++;
            return 0;
        }
        data_ov002_022ce288.step--;
        return 0;
    case 2:
        if (self->id == 0x1727 || self->id == 0x1895)
            func_ov002_021f4a4c((struct F021f4a4c_Self *)self, arg);
        return 1;
    default:
        return 0;
    }
}




