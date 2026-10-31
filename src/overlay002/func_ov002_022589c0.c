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
typedef struct { u16 id; char pad[18]; } Field;
typedef struct { Field cards[107]; char pad[12]; } Fields;
typedef struct { char pad[0xcf8]; int phase; char pad2[0x84]; int error; } State;
extern Player data_ov002_022cf16c[];
extern Fields data_ov002_022cf1a4[];
extern int data_ov002_022cd73c[];
extern State data_ov002_022d016c;
extern int func_0202e234(int x);
extern int func_0203158c(int x);
extern int func_ov002_021bd710(int a,int b);
extern int func_ov002_021bd948(int a,int b);
extern int func_ov002_021bdc94(int a,int b);
extern int func_ov002_021bdde0(int a,int b);
extern int func_ov002_021be2d8(int a,int b,int c);
extern int func_ov002_021fc1a0(Card *self, Card *other);
extern int func_ov002_0225753c(u16 id);
int func_ov002_022589c0(u16 card,int player,int slot) {
 Entry *entry = &data_ov002_022cf16c[player & 1].cards[slot];
 int result=0;
 if(slot>4) return result;
 if(player == (data_ov002_022cd73c[1]^1)) {
  if(func_0202e234(card) && entry->x8 && func_0203158c(card)) {
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
 switch(data_ov002_022d016c.phase) {
 case 2: case 4:
  if(func_ov002_021bd710(player,slot)) {
   if(player==data_ov002_022cd73c[1]) data_ov002_022d016c.error=0x10;
  } else if(func_ov002_021bd948(player,slot)) {
   if(entry->x8) {
    if(entry->x6) result|=0x100; else result|=0x200;
   } else {
    if(!entry->x6) result|=0x200;
    if(func_ov002_021bdc94(player,slot)) result|=0x20;
   }
  }
  break;
 case 3:
  if(!func_ov002_021bdde0(player,slot)) {
   data_ov002_022d016c.error=7;
   if(func_ov002_021be2d8(player,slot,1)) result|=1;
  } else data_ov002_022d016c.error=8;
  break;
 }
 if(data_ov002_022cf1a4[player & 1].cards[slot].id && func_0202e234(card) && func_ov002_0225753c(card)) {
  Card q={0};
  q.id=card;
  q.side=(u16)player;
  q.zone=(u16)slot;
  q.tag=0;
  q.mode=3;
  q.index=(u16)(data_ov002_022cf16c[player & 1].cards[slot].index*2+data_ov002_022cf16c[player & 1].cards[slot].side);
  data_ov002_022d016c.error=4;
  if(func_ov002_021fc1a0(&q,0)) result|=8;
 }
 return result;
}


