typedef unsigned short u16;
typedef unsigned char u8;
typedef struct Ov002Self { u16 f0; u16 b0:1; u16 rest:15; } Card021c1e44;
struct State { char pad[0x5a8]; int state; unsigned index; };
struct Card { unsigned id:13; unsigned rest:19; };
struct Table { char pad[12]; unsigned count; char gap[0x110]; struct Card cards[1]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[], data_ov002_022cf178[];
extern struct { char pad[0xcec]; int player; } data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_0202b8f0(int);
extern int func_0202b950(int);
extern int func_0202e234(int);
extern void func_ov002_021d6714(int,int,int);
extern int func_ov002_021de408(int,int);
extern void func_ov002_021e2550(void *,int,int,int);
extern void func_ov002_021e276c(void *,int,int,int);
extern int func_ov002_021e27c0(int,int);
extern int func_ov002_021e2b1c(int);
/* Original omits unused argument. */
extern void func_ov002_021e2b3c();
/* Original omits unused argument. */
extern void func_ov002_021e2c5c();
extern int func_ov002_021e8b34(Card021c1e44 *,int,int);
extern int func_ov002_021f1e94(struct Ov002Self *,int,int);
extern int func_ov002_02213654(void);
extern unsigned func_ov002_02257750(void *,int (*)(void *,int,int));
/* Original supplies two arguments; remaining arguments are unused here. */
extern int func_ov002_02257878();
extern void func_ov002_022592ec(int);
int func_ov002_0221365c(Card021c1e44 *self) {
 int other = 1-self->b0;
 int i;
 switch(data_ov002_022ce288.state) {
 case 0x80:
  func_ov002_021e27c0(other,1);
  for(i=0;i<=10;i++) {
   if(func_ov002_021e8b34(self,other,i)) func_ov002_021d6714(other,i,1);
  }
  return 0x7f;
 case 0x7f:
  func_ov002_021e2b3c();
  func_ov002_021de408((int)self,func_ov002_02257750(self,(int (*)(void *,int,int))func_ov002_021f1e94));
  data_ov002_022ce288.index=0;
  return 0x7e;
 case 0x7e: {
  int offset=(other&1)*0x868;
  if(data_ov002_022ce288.index < *(unsigned *)(data_ov002_022cf178+offset)) { 
  int id;
  struct Table *table=(struct Table *)(data_ov002_022cf16c+offset);
  do {
   id=table->cards[data_ov002_022ce288.index].id;
   if(func_0202e234(id)) {
    int yes=0;
    switch(self->f0) {
    case 0x123b: yes=func_0202b8f0(id)>=1500; break;
    case 0x188c: yes=func_0202b950(id)<=1500; break;
    }
    if(yes) {
     func_ov002_021e2550(other,data_ov002_022ce288.index,(int)data_ov002_022cf16c+offset+0x120+data_ov002_022ce288.index*4,1);
     return 0x7e;
    }
   }
   data_ov002_022ce288.index++;
  } while(data_ov002_022ce288.index < table->count); }
  return 0x7d;
 }
 case 0x7d: {
  int player;
  func_ov002_021e2c5c();
  player=self->b0;
  func_ov002_021e276c(1-player,self->f0,(u16)(((u8)((data_ov002_022d016c.player==player)+4)<<4)|1),0);
  return 0x7c;
 }
 case 0x7c:
  if(*(unsigned *)(data_ov002_022cf178+(other&1)*0x868)==0) {
   if(!func_ov002_02257878(self,func_ov002_021e8b34)) return 0;
  }
  if(data_ov002_022cd744[self->b0]==1) func_ov002_021e2b1c(30);
  else func_ov002_022592ec((int)func_ov002_02213654);
  return 0x7b;
 case 0x7b:
  for(i=0;i<=10;i++) {
   if(func_ov002_021e8b34(self,other,i)) func_ov002_021d6714(other,i,0);
  }
  func_ov002_021e27c0(1-self->b0,0);
  return 0;
 }
 return 0;
}




