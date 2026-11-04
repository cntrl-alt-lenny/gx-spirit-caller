typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
 u16 id;
 u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1;
 u16 low:6, index:9, high:1;
 u16 unused;
 int a,b,c,d;
} Card;
typedef struct { u32 id:13, side:1, middle:8, index:8, high:2; u16 x4,x6,x8; char pad[10]; } Entry;
typedef struct { char pad[48]; Entry cards[5]; char tail[2004]; } Player;
typedef struct { char pad[0xcec]; int owner; int pad3[2]; int phase; char pad2[0x84]; int error; } State;
extern Player data_ov002_022cf16c[];
extern int data_ov002_022cd73c[];
extern State data_ov002_022d016c;
extern int func_0202b878(int x);
extern int func_0202b8c0(int x);
extern int func_0202e234(int x);
extern int func_0203158c(int x);
extern int func_ov002_021b3ecc(int a,int b,int c);
extern int func_ov002_021bd710(int a,int b);
extern int func_ov002_021fc1a0(Card *self, Card *other);
extern int func_ov002_021fd584(int side,int slot,u16 id);
extern int func_ov002_021fd668(int side,int slot,u16 id);
extern int func_ov002_0225753c(u16 id);
int func_ov002_02258d4c(u16 card,int player,int slot) {
 Entry *entry = &data_ov002_022cf16c[player & 1].cards[slot];
 int result=0;
 if(func_ov002_021bd710(player,slot)) {
  if(player==data_ov002_022cd73c[1]) data_ov002_022d016c.error=0x10;
  return 0;
 }
 if(player == (data_ov002_022cd73c[1]^1)) {
  if(func_0202e234(card) == 0 && entry->x8 && func_0203158c(card)) {
   Card q={0};
   q.id=card;
   q.side=(u16)player;
   q.flip=1;
   q.zone=(u16)slot;
   q.tag=0;
   q.mode=3;
   q.index=(u16)(data_ov002_022cf16c[player & 1].cards[slot].index*2+data_ov002_022cf16c[player & 1].cards[slot].side);
   data_ov002_022d016c.error=4;
   if(func_ov002_021fc1a0(&q,0)) result|=8;
  }
  return result;
 }
 if(entry->x8 == 0) {
  switch(func_0202b878(card)) {
  case 0x16: {
   int f = 0;
   int ph;
   data_ov002_022d016c.error=4;
   if(func_0202b8c0(card)==5) f=1;
   ph = data_ov002_022d016c.phase;
   if(ph==2 || ph==4) {
    if(data_ov002_022d016c.owner == data_ov002_022cd73c[1]) f=1;
   }
   if(ph==1 && card==0x131e) f=1;
   if(f) {
    if(func_0202b8c0(card)==3) data_ov002_022d016c.error=10;
    if(func_ov002_021fd668(player,slot,card)) result|=8;
   } else if(ph==3) data_ov002_022d016c.error=5;
   break;
  }
  case 0x17:
   data_ov002_022d016c.error=4;
   if(func_ov002_021fd668(player,slot,card)) result|=8;
   break;
  }
 } else {
  if(func_ov002_0225753c(card)) {
   data_ov002_022d016c.error=4;
   if(func_ov002_021fd584(player,slot,card)) result|=8;
  }
 }
 if(func_0202e234(card) == 0) {
  if(func_ov002_021b3ecc(0,0xb,0x1407)) result&=~8;
 }
 return result;
}
