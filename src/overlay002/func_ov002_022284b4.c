typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { unsigned int id:13, lo:1, pad:8, hi:8, rest:2; } Card;
typedef struct { unsigned int id:13, lo:1, pad:8, hi:8, rest:2; char extra[16]; } Slot;
typedef struct { char pad[0x30]; Slot ents[1]; char tail[0x824]; } Side;
typedef struct { u16 value; char pad[18]; } Entry;
typedef struct { Entry ents[1]; char pad[0x854]; } Values;
typedef struct { u16 f0; struct { u16 side:1, idx:5, pad:6, mode:2, rest:2; } f2; struct { u16 pad:6, val:9, rest:1; } f4; char tail[18]; } Self;
struct Node0223def4 { char _pad[8]; u16 arr8[5]; u16 f18; };
extern Side data_ov002_022cf16c[];
extern Values data_ov002_022cf1a4[];
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021e797c(Self *self, int player, int idx);
extern int func_ov002_021d8414(int arg0,int arg1,int arg2,int arg3,int arg4,int arg5,int arg6);
extern int func_ov002_021d5d58(int a,int b,int c,int d);
int func_ov002_022284b4(Self *self) {
    unsigned int side = self->f2.side;
    unsigned int idx = self->f2.idx;
    unsigned int val = self->f4.val;
    Slot *p = &data_ov002_022cf16c[side & 1].ents[idx];
    int id, slot, dest;
    Self cmd;
    int *z;
    if (val != p->hi * 2 + p->lo) return 0;
    if (data_ov002_022cf1a4[side & 1].ents[idx].value == 0) return 0;
    id = func_ov002_0223def4((struct Node0223def4 *)self, 0);
    slot = func_ov002_021b99b4(self->f2.side, id);
    dest = func_ov002_021bd030(self->f2.side);
    z = (int *)&cmd;
    z[0]=0; z[1]=0; z[2]=0; z[3]=0; z[4]=0; z[5]=0;
    if (dest < 0) return 0;
    if (slot < 0) return 0;
    cmd.f2.side = self->f2.side;
    cmd.f2.idx = 11;
    cmd.f2.mode = 0;
    cmd.f0 = ((Card *)((char *)&data_ov002_022cf16c[self->f2.side & 1] + 0x418))[slot].id;
    cmd.f4.val = (u16)id;
    if (func_ov002_021e797c(&cmd, self->f2.side, self->f2.idx) == 1) {
        func_ov002_021d8414(self->f2.side,14,id,self->f2.side,dest,1,0);
        func_ov002_021d5d58(self->f2.side,(u16)((u8)self->f2.side | ((u8)dest << 8)),(u16)((u8)self->f2.side | ((u8)self->f2.idx << 8)),10);
    }
    return 0;
}

