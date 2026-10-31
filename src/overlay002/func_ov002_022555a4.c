typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Slot { u32 pad[14]; u16 h38; u16 pad3a; int w3c; u32 w40; };
struct Ctx { char pad[0xcec]; int w; };
struct Node { u16 id; u16 owner:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2; u16 low:6; u16 index:9; u16 high:1; u16 f6; int extra[4]; };
extern char data_ov002_022cf16c[];
extern struct Ctx data_ov002_022d016c;
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021b4120(int arg0,int arg1,int arg2);
extern int func_ov002_021b8fcc(int a0,int a1);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021d59cc(int a,int b,int c,int d,u16 e);
extern void func_ov002_021d5b80(int a,int b,int c,int d);
extern int func_ov002_021de4b0(int a,int b,int c);
extern int func_ov002_021dec2c(int p,int slot,int q,u16 v);
extern int func_ov002_021ded54(int a,int b,int c,int d,int e);
extern void func_ov002_021e2d94(int a,int b,int c,int d);
int func_ov002_022555a4(void) {
 int i,player,j,id,pair,dest;
 struct Bits *q;
 struct Slot *p;
 char *base;
 for(i=0;i<2;i++) {
  player=data_ov002_022d016c.w ^ i;
  p=(struct Slot *)((player&1)*0x868+data_ov002_022cf16c);
  q=(struct Bits *)((char *)p+0x30);
  for(j=0;j<=4;j++) {
   id=q->id;
   if(func_ov002_021b8fcc(player,j)) {
    pair=func_ov002_021b4120(player,j,0x1472);
    if((u8)pair==player) {
     struct Node n={0};
     dest=(u8)((u16)pair>>8);
     n.index=(u16)(q->idx*2+q->flag);
     n.owner=(u16)player;
     n.slot=(u16)j;
     n.id=id;
     n.mode=1;
     if(dest<0 || ((struct Bits *)(data_ov002_022cf16c+(player&1)*0x868+dest*0x14+0x30))->id) {
      func_ov002_021de4b0((int)&n,player,j);
      return 1;
     }
     if(p->h38==0) {
      func_ov002_021ded54((int)&n,player,j,player,dest);
      func_ov002_021e2d94(player,dest,20,1);
      return 1;
     }
     if((p->w40>>6)&1) {
      if(func_0202b8c0(id)==4) func_ov002_021ded54((int)&n,player,j,player,dest);
      else func_ov002_021dec2c(player,j,0,0);
      return 1;
     }
    } else {
     func_ov002_021d5b80(player,j,0x1472,1);
     func_ov002_021d59cc(player,j,0x1472,5,(u16)((u8)player|((u8)(func_ov002_021bd030(player)<0?0:func_ov002_021bd030(player))<<8)));
    }
   }
   q=(struct Bits *)((char *)q+0x14);
   p=(struct Slot *)((char *)p+0x14);
  }
 }
 return 0;
}


