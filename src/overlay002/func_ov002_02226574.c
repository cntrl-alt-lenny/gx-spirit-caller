typedef unsigned short u16;
typedef unsigned char u8;
struct Input { u16 code; u16 side:1; u16 pad:11; u16 mode:2; u16 rest:2; char gap[16]; unsigned flags; };
struct Row { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned field:8; unsigned rest:2; char tail[16]; };
struct Entry { u16 id:13; u16 rest:3; u16 other; };
struct State { char pad[0x5a8]; int state; int count; };
struct node;
struct Node;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern int data_ov002_022cf1ac[];
extern struct Entry data_ov002_022d0250[];
extern struct State data_ov002_022ce288;
extern int func_0202e234(int);
extern int func_0202e2f8(int);
extern unsigned func_ov002_021b947c(unsigned);
extern int func_ov002_021bc6c4(int);
extern int func_ov002_021c10e8(int,int,int);
extern void func_ov002_021d81d4(unsigned,unsigned);
extern void func_ov002_021d8474(int,int,int,int,int,int,int);
extern int func_ov002_021de480(int,int,int,int);
extern int func_ov002_021de678(struct Input *,int,int,int);
extern void func_ov002_021e276c(void *,int,int,int);
extern void func_ov002_021e2d94(int,int,int,int);
extern u16 func_ov002_0223de94(struct node *,int);
extern int func_ov002_0223df38(struct Node *,int,int *);
extern int func_ov002_0225764c(int,int,int);
int func_ov002_02226574(struct Input *self) {

    if (self->mode == 0) {
        if (func_ov002_0223df38((struct Node *)self,0,0)) {
            int pair = func_ov002_0223de94((struct node *)self,0);
            int side = (u8)pair;
            int slot = (u8)((u16)pair >> 8);
            if (func_ov002_0225764c((int)self,side,slot)) {
                unsigned offset = (side & 1) * 0x868;
                int stride = slot * 20;
                struct Row *row = (struct Row *)(data_ov002_022cf16c + offset + 0x30);
                int number = ((struct Row *)((char *)row + stride))->field * 2 + ((struct Row *)((char *)row + stride))->side;
                if (!func_ov002_021de678(self,side,slot,0x2000)) return 0;
                if (!func_0202e2f8(((struct Row *)((char *)row + stride))->id)) {
                    u16 value = *(u16 *)(data_ov002_022cf1a2 + offset + stride);
                    func_ov002_021e276c((void *)self->side,self->code,1,(u16)(func_ov002_021c10e8(side,slot,1) * 4 + number * 8 + value * 2 + 1));
                }
            }
        }
        return 0;
    } else {
        int side = (self->code == 0x1a02) ^ self->side;
        unsigned slot = self->flags >> 3;
        unsigned c = ((self->flags >> 2) & 1);
        unsigned b = ((self->flags >> 1) & 1);
        unsigned a = (self->flags & 1);
        unsigned pair = func_ov002_021b947c(slot);
        int id = data_ov002_022d0250[slot].id;
        switch (data_ov002_022ce288.state) {
        case 0x80: {
            int low = (u8)pair;
            int count = func_ov002_021bc6c4(side);
            int hi = (u8)((u16)pair >> 8);
            data_ov002_022ce288.count = count;
            if (hi != 15) return 0;
            if (count < 0) {
                func_ov002_021d81d4(low,slot);
                return 0;
            }
            func_ov002_021d8474(low,15,slot,side,count,a,b);
            return 0x7f;
        }
        case 0x7f:
            if (!func_0202e234(id)) {
                func_ov002_021de480(side,data_ov002_022ce288.count,0,self->code);
            } else if (side != c) {
                func_ov002_021e2d94(side,data_ov002_022ce288.count,0,!(*(unsigned *)((char *)data_ov002_022cf1ac + (side & 1) * 0x868 + data_ov002_022ce288.count * 20) & 1));
            }
            return 0;
        }
    }
    return 0;
}






