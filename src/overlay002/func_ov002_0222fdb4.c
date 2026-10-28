typedef unsigned short u16;
typedef struct Card {
 u16 id; u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1;
 u16 unused4:5; u16 active:1; u16 unused5:10; u16 pad[9]; u16 effect; u16 owner:1; u16 unused6:15;
} Card;
struct State { char pad[0x5a8]; int phase; };
struct Selected { char pad[0xb0]; u16 index; };
struct Entry { u16 id:13; u16 rest:3; u16 pad; };
extern struct State data_ov002_022ce288;
extern struct Selected data_ov002_022d0e6c;
extern struct Entry data_ov002_022d0250[];
extern char data_ov002_022cf178[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202e234(int x);
extern int func_ov002_021ca5bc(int arg0);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_0226af38(int arg0, int arg1, int arg2);
int func_ov002_0222fdb4(Card *card) {
 switch(data_ov002_022ce288.phase) {
 case 0x80: {
  int side=1-card->side;
  if(*(int *)(data_ov002_022cf178+(side&1)*0x868)==0) return 0;
  func_ov002_0226af38(side,1,1);
  return 0x7f;
 }
 case 0x7f:
  if(func_ov002_021ca5bc(data_ov002_022d0e6c.index)!=0) {
   int id=data_ov002_022d0250[data_ov002_022d0e6c.index].id;
   if(func_0202e234(id)!=0) {
    func_ov002_021df818(card,1-card->side,func_0202b8a8(id)*100);
   }
  }
  return 0;
 default: return 0;
 }
}
