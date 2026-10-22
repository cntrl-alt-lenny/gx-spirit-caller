typedef unsigned short u16;
typedef unsigned char u8;
struct Input { u16 code; u16 side:1; u16 rest:15; };
struct State { char pad[0x5a8]; int state; int count; };
struct Command { unsigned id:13; unsigned side:1; unsigned rest:18; };
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 rest:10; } Card021c1e44;
struct node;
struct Node;
extern struct State data_ov002_022ce288;
extern u8 data_ov002_022cf1a4[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021bc618(int);
extern int func_ov002_021bc6c4(int);
extern int func_ov002_021c1e44(Card021c1e44 *,int,int);
/* This caller supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca3f0(int,int);
extern int func_ov002_021b9ecc(int,int);
extern void func_ov002_021c4c9c(int,int,int *);
extern int func_ov002_021d59cc(int,int,int,int,u16);
extern u16 func_ov002_0223de94(struct node *,int);
extern int func_ov002_0223df38(struct Node *,int,int *);
extern int func_ov002_0227adb8(int,int,int,int);
int func_ov002_02226860(struct Input *self) {
    int pair, side, slot;

    int info[11];
    int a,b,c;
    int value;
    switch(data_ov002_022ce288.state) {
    case 0x80:
        if (!func_ov002_021bc618(self->side)) return 0;
        if (!func_ov002_021ca2b8(self->side)) return 0;
        if (func_ov002_0223df38((struct Node *)self,0,0)) {
            pair = func_ov002_0223de94((struct node *)self,0);
            side = (u8)pair;
            slot = (u8)((u16)pair >> 8);
            if (*(u16 *)(data_ov002_022cf1a4 + (side & 1)*0x868 + slot*20) != 0) {
                if (!func_ov002_021c1e44((Card021c1e44 *)self,side,slot)) {
                    if (func_ov002_021ca3f0(self->side,func_ov002_021b9ecc(side,slot))) {
                        struct Command cmd = {0};
                        cmd.id = 0x1602;
                        cmd.side = self->side;
                        data_ov002_022ce288.count = func_ov002_021bc6c4(self->side);
                        func_ov002_0227adb8(self->side,(int)&cmd,1,(self->code << 16) | 1);
                        return 0x7f;
                    }
                }
            }
        }
        break;
    case 0x7f:
        pair = func_ov002_0223de94((struct node *)self,0);
        side = (u8)pair;
        slot = (u8)((u16)pair >> 8);
        func_ov002_021c4c9c(side,slot,info);
        a = func_0202b878(info[0]);
        b = func_0202b890(info[0]);
        c = func_0202b8a8(info[0]);
        func_ov002_021d59cc(self->side,data_ov002_022ce288.count,0x1602,5,(u16)((u8)((b & 15) | ((u8)(c & 15)<<4)) | ((u8)a << 8)));
        value = info[7];
        if (value > 0xffff) value = 0xffff;
        func_ov002_021d59cc(self->side,data_ov002_022ce288.count,0x1602,5,(u16)value);
        value = info[8];
        if (value > 0xffff) value = 0xffff;
        func_ov002_021d59cc(self->side,data_ov002_022ce288.count,0x1602,5,(u16)value);
        func_ov002_021d59cc(side,slot,(u16)((u8)self->side | ((u8)data_ov002_022ce288.count << 8)),7,0);
        break;
    }
    return 0;
}


