typedef unsigned short u16;
typedef unsigned char u8;
struct Card { u16 id; u16 side:1; u16 rest:15; u16 pad:6; u16 number:9; u16 last:1; };
struct node { char _pad[8]; u16 arr8[5]; u16 f18; };
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { char pad[6]; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
struct Row { unsigned id:13; unsigned rest:19; char tail[16]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021bd030(int self);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021d8414(int arg0,int arg1,int arg2,int arg3,int arg4,int arg5,int arg6);
/* Original supplies three arguments; the C thunk has an unused fourth. */
extern int func_ov002_021d5d48();
extern int func_ov002_021c1d28(int a,int b,int c);
extern int func_ov002_021c1a2c(int a,int b,int c);
extern void func_ov002_0226b11c(int unused0,int unused1);
int func_ov002_0221f0e4(struct Card *self) {
    int side, kind, dest;
    int pair;
    if (func_ov002_021b99b4(self->side,self->number)<0) return 0;
    if (func_ov002_021bd030(self->side)==-1) return 0;
    if (func_ov002_0223df38((struct Node *)self,0,0)) {
        pair=func_ov002_0223de94((struct node *)self,0);
        side=(u8)pair;
        kind=(u8)((u16)pair>>8);
        if (side!=self->side && ((struct Row *)(data_ov002_022cf16c+(side&1)*0x868+0x30+kind*20))->id!=0 && *(u16 *)(data_ov002_022cf1a4+(side&1)*0x868+kind*20)!=0) {
            dest=func_ov002_021bd030(self->side);
            func_ov002_021d8414(self->side,14,self->number,self->side,dest,1,0);
            func_ov002_021d5d48(self->side,(u16)((u8)self->side|((u8)dest<<8)),(u16)((u8)side|((u8)kind<<8)));
            if (side!=self->side && func_ov002_021c1d28(side,kind,side!=self->side)==0 && func_ov002_021c1a2c(side,kind,self->id)!=0) func_ov002_0226b11c(side,kind);
        }
    }
    return 0;
}


