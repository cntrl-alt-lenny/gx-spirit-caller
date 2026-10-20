typedef unsigned short u16;
typedef unsigned int u32;
struct Card {
 u16 id;
 u16 player:1; u16 slot:5; u16 kind:6; u16 mode:2; u16 flag:1; u16 unused:1;
 u16 low:6; u16 value:9; u16 high:1;
 u16 pad;
 u32 a,b,c,extra;
};
struct State {
 u32 side:1; u32 pad0:5; u32 flags:2; u32 card:15; u32 slot:9;
 int unk4; unsigned char count; unsigned char padding[13];
 u16 pad22:4; u16 mode:2; u16 pad23:10;
 u32 state:8; u32 rest:24;
};
extern struct State data_ov002_022cd300;
extern char data_ov002_022d016c[];
extern int data_ov002_022cd744[];
extern int func_ov002_021ae484(int x);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bcb10(int side,int card,int mode);
extern int func_ov002_021fd270(struct Card *,struct Card *);
extern int func_ov002_02271ab4(void);
int func_ov002_022752b8(void) {
 switch(data_ov002_022cd300.state) {
 case 0: case 30:
  *(int *)(data_ov002_022d016c+0xd44)=0;
  if(data_ov002_022cd300.mode==0 && (data_ov002_022cd300.flags==0 || func_ov002_021bb068(0x135d)!=0) && func_ov002_021bcb10(data_ov002_022cd300.side,data_ov002_022cd300.card,1)>=3) {
   u16 id=data_ov002_022cd300.card;
   struct Card card={0};
   card.player=data_ov002_022cd300.side;
   card.slot=0;
   card.id=id;
   card.value=data_ov002_022cd300.slot;
   card.mode=1;
   if(func_ov002_021fd270(&card,0)!=0) {
    if(data_ov002_022cd744[data_ov002_022cd300.side]==1) *(int *)(data_ov002_022d016c+0xd44)=1;
    else func_ov002_021ae484(0x123);
   }
  }
  data_ov002_022cd300.count=0;
  data_ov002_022cd300.state=1;
  return 0;
 case 1:
  if(*(int *)(data_ov002_022d016c+0xd44)!=0) data_ov002_022cd300.state=31;
  else data_ov002_022cd300.state=0;
  break;
 }
 return func_ov002_02271ab4();
}









