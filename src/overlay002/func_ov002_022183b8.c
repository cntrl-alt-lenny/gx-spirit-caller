typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Card {
 u16 id;
 u16 side:1; u16 pad2:15;
 u16 pad3:6; u16 value:9; u16 pad4:1;
} Card;
struct Ctrl { char pad[0x5a8]; int state; int count; };
struct Global { char pad[0xd44]; int flag; };
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
extern struct Ctrl data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021ae4bc(int self, int idx);
extern int func_ov002_021ba294(int player, int arg1);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c9df0(int arg);
/* Original supplies only r0 to this forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e05fc(int side, int amount);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_022183b8(Card *card) {
 switch (data_ov002_022ce288.state) {
 case 0x80:
  switch(card->id) {
  case 0x1339: func_ov002_021df818(card,1-card->side,500); break;
  case 0x133a: func_ov002_021e05fc(card->side,1000); break;
  }
  return 0x7f;
 case 0x7f:
  data_ov002_022ce288.count=0;
  if(func_ov002_021bc618(card->side)==0) return 0;
  if(func_ov002_021ca2b8(card->side)==0) return 0;
  if(card->id==0x133a || card->id==0x136a) {
   if(func_ov002_021c9df0(card->side)==0) return 0;
  }
  if(func_ov002_0225368c(card->side,card->id,0)==0) return 0;
 case 0x7e:
  if(func_ov002_021bc618(card->side)==0 || func_ov002_0225368c(card->side,card->id,0)==0) return 0x64;
  if(card->id==0x136a && data_ov002_022ce288.count!=0) return 0x64;
  if(data_ov002_022cd744[card->side]==1) data_ov002_022d016c.flag=1;
  else {
   switch(card->id) {
   case 0x1339: func_ov002_021ae4bc(0x35,card->value); break;
   case 0x133a: case 0x136a: func_ov002_021ae4bc(0x34,card->value); break;
   }
  }
  return 0x7d;
 case 0x7d:
  if(data_ov002_022d016c.flag==0) return 0x64;
  if(data_ov002_022ce288.count++==0) func_ov002_021e2b3c(data_ov002_022ce288.count);
  switch(card->id) {
  case 0x1339: {
   int side=card->side;
   int index=func_ov002_021ba294(side,card->id);
   func_ov002_0227ac64(side,(struct Record *)(data_ov002_022cf16c+(side&1)*0x868+0x260)+index,1,0,0);
   break;
  }
  case 0x133a: case 0x136a: {
   int side=card->side;
   int index=func_ov002_021ba294(side,card->id);
   func_ov002_0227ac64(side,(struct Record *)(data_ov002_022cf16c+(side&1)*0x868+0x260)+index,0,1,0);
   break;
  }
  }
  return 0x7e;
 case 0x64:
  func_ov002_021e286c(card->side);
  if(data_ov002_022ce288.count!=0) func_ov002_021e2c5c(data_ov002_022ce288.count);
  return 0;
 default: return 0;
 }
}

