typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1; u16 pad:5; u16 kind:6; u16 rest:4; char gap[8]; u16 result; } Card;
struct Self;
struct State { char pad[0x5b8]; int state; };
struct Context { int side; char gap[0x18]; int slot; };
struct Request { char gap[0xd44]; int mode; char gap2[0x28]; int side, slot, extra; };
struct Slot { u32 id:13; u32 rest:19; char pad[16]; }; struct Board { char pad[0x30]; struct Slot slots[1]; };
extern struct State data_ov002_022ce288;
extern struct Context data_ov002_022cd3f4;
extern int data_ov002_022cd744[];
extern struct Request data_ov002_022d016c;
extern char data_ov002_022cf16c[], data_ov002_022cf1a2[];
extern int func_ov002_022577dc(void *self);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern void func_ov002_021ae514(int,int,int,int,int,int);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_0223dcc0(struct Self *self,int side,int slot);
extern int func_ov002_02280df4(Card *,int,int,int);
extern int func_ov002_022575c8(int a0,int a1,int a2);
extern void func_ov002_0225935c(int arg0,int arg1,int arg2);
extern int func_ov002_022593f4(void);
int func_ov002_02240364(Card *self) {
    int available, other, side, slot, off, pos;
    switch (data_ov002_022ce288.state) {
    case 0:
        available = func_ov002_022577dc(self) > 0;
        other = 0;
        if ((u16)(self->kind + 0xffee) <= 1) {
            side = data_ov002_022cd3f4.side;
            slot = data_ov002_022cd3f4.slot;
            off = (side & 1) * 0x868;
            pos = slot * 0x14;
            if (((struct Board *)(data_ov002_022cf16c + off))->slots[slot].id != 0 &&
                *(u16 *)(data_ov002_022cf1a2 + off + pos) == 0 &&
                func_ov002_021c1ef0(self, side, slot) != 0) {
                if (self->side != side) other = 1;
            }
        }
        if (available && other) {
            if (data_ov002_022cd744[self->side] == 1) data_ov002_022d016c.mode = 2;
            else func_ov002_021ae514(0x103, 0x1a0, 0x1a1, 0x1a2, 0, 0xf);
        } else if (other) data_ov002_022d016c.mode = 0;
        else if (available) data_ov002_022d016c.mode = 1;
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        self->result = data_ov002_022d016c.mode + 1;
        if (data_ov002_022d016c.mode != 1)
            func_ov002_0223dcc0((struct Self *)self, data_ov002_022cd3f4.side, data_ov002_022cd3f4.slot);
        if (data_ov002_022d016c.mode == 0) return 1;
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if (data_ov002_022cd744[self->side] == 1) {
            slot = func_ov002_02280df4(self,self->side,-1,1);
            func_ov002_0223dcc0((struct Self *)self,self->side,slot);
            return 1;
        }
        func_ov002_021ae400(self->side,0x79);
        func_ov002_0225935c(self->side,self->id,(int)func_ov002_022575c8);
        data_ov002_022ce288.state++;
        return 0;
    case 3:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0((struct Self *)self,data_ov002_022d016c.side,data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            return 1;
        }
        data_ov002_022ce288.state--;
        return 0;
    }
    return 0;
}




