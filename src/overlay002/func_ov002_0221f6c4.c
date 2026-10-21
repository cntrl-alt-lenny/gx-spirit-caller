typedef unsigned short u16;
typedef unsigned char u8;
struct Card { u16 id; u16 flags; u16 pad:2; u16 blocked:1; u16 rest:13; };
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 rest:10; } Card021c1e44;
struct Ov002Self;
struct State { char pad[0x5a8]; int mode; };
struct Flags { char pad[0xd0]; unsigned flags; };
struct Context { int side, player; char pad[0x18]; int slot; };
struct Packed { unsigned low:13; unsigned flag:1; unsigned middle:8; unsigned index:8; unsigned high:2; };
struct Row { struct Packed p; char tail[16]; };
struct Player { int value; char tail[0x34]; };
extern struct State data_ov002_022ce288;
extern struct Flags data_ov002_022d016c;
extern struct Context data_ov002_022cd3f4;
extern struct Player data_ov002_022cd42c[];
extern char data_ov002_022cf16c[], data_ov002_022cf1a4[], data_ov002_022cf1a2[];
extern int func_ov002_0223df38(struct Node *self,int idx,int *out);
extern u16 func_ov002_0223de94(struct node *arg0,int arg1);
extern int func_ov002_021c1e44(Card021c1e44 *a0,int a1,int a2);
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern void func_ov002_021e2cd4(int bit,int val);
extern int func_ov002_021d6808(struct Ov002Self *self,int player,int idx,int arg3,int arg4);
extern int func_ov002_021be4a0(int a,int b,int c);
extern int func_ov002_021c031c(int arg0,int unused1);
extern int func_ov002_021c034c(int a,int b,int c);
extern int func_ov002_021bf294(int a,int b,int c,int d,int e);
extern int func_ov002_0226b204(unsigned int arg);
int func_ov002_0221f6c4(struct Card *self) {
 int side, slot, pair, valid;
 struct Row *p;
 switch(data_ov002_022ce288.mode) {
 case 0x80:
  if(self->blocked) return 0;
  if(data_ov002_022d016c.flags & 1) return 0;
  if(!((data_ov002_022d016c.flags >> 1)&1)) return 0;
  valid=0;
  if(func_ov002_0223df38((struct Node *)self,1,0)) {
   pair=func_ov002_0223de94((struct node *)self,1);
   side=(u8)pair; slot=(u8)((u16)pair>>8);
   if(*(u16 *)(data_ov002_022cf1a4+(side&1)*0x868+slot*20)) valid=1;
  }
  if(!valid) return 0;
  if(func_ov002_0223df38((struct Node *)self,0,0)) {
   pair=func_ov002_0223de94((struct node *)self,0);
   side=(u8)pair; slot=(u8)((u16)pair>>8);
   if(*(u16 *)(data_ov002_022cf1a4+(side&1)*0x868+slot*20) && !func_ov002_021c1e44((Card021c1e44 *)self,side,slot)) {
    func_ov002_021d479c((u16)((side?0x8000:0)|0x1b),(u16)slot,1,0);
    func_ov002_021e2cd4(1,0);
    return 0x7f;
   }
  }
  return 0;
 case 0x7f: { int side, slot, pair;
  if(data_ov002_022cd3f4.slot<5) {
   p=(struct Row *)(data_ov002_022cf16c+(data_ov002_022cd3f4.player&1)*0x868+0x30);
   if(data_ov002_022cd42c[1-data_ov002_022cd3f4.side].value != p[data_ov002_022cd3f4.slot].p.index*2+p[data_ov002_022cd3f4.slot].p.flag) return 0;
  }
  if(func_ov002_0223df38((struct Node *)self,1,0)) {
   pair=func_ov002_0223de94((struct node *)self,1);
   side=(u8)pair; slot=(u8)((u16)pair>>8);
   if(*(u16 *)(data_ov002_022cf1a4+(side&1)*0x868+slot*20) && !func_ov002_021c1e44((Card021c1e44 *)self,side,slot)) {
    if(*(u16 *)(data_ov002_022cf1a2+(side&1)*0x868+slot*20)) func_ov002_021d6808((struct Ov002Self *)self,side,slot,0,0);
    return 0x7e;
   }
  }
  return 0;
 } case 0x7e:
  pair=func_ov002_0223de94((struct node *)self,1);
  side=(u8)pair; slot=(u8)((u16)pair>>8);
  if(!func_ov002_021be4a0(side,slot,0)) return 0;
  if(data_ov002_022cd3f4.slot>=5) {
   if(!func_ov002_021c031c(side,slot) && !func_ov002_021c034c(side,slot,1)) return 0;
   func_ov002_021d479c((u16)((side?0x8000:0)|0x1a),(u16)slot,1,0);
  } else {
   if(!func_ov002_021bf294(side,slot,data_ov002_022cd3f4.player,data_ov002_022cd3f4.slot,0)) return 0;
   func_ov002_021d479c((u16)((side?0x8000:0)|0x19),(u16)slot,(u16)data_ov002_022cd3f4.slot,(u16)data_ov002_022cd3f4.player);
  }
  return 0x7d;
 case 0x7d:
  func_ov002_0226b204(0); return 0;
 }
 return 0;
}



