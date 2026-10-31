typedef unsigned short u16;
typedef struct Card {
 u16 id; u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1;
 u16 unused4:5; u16 active:1; u16 unused5:10;
 u16 pad[9]; u16 effect; u16 owner:1; u16 unused6:15;
} Card;
struct State { char pad[0x5a8]; int phase; int count; };
struct PlayerCount { int count; char pad[0x864]; };
struct Player { char pad[0x120]; char cards[0x748]; };
extern struct State data_ov002_022ce288;
extern struct PlayerCount data_ov002_022cf178[];
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021c23ac(int player, int index);
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern int func_ov002_021ded1c(int a, int b);
extern int func_ov002_021df818(Card *card, int side, int amount);
int func_ov002_0222b73c(Card *self) {
 int player, i;
 switch (data_ov002_022ce288.phase) {
 case 0x80:
  data_ov002_022ce288.count=0;
  for(player=0; player<2; player++) {
   for(i=0; i<=10; i++) {
    if(func_ov002_021c23ac(player,i)) data_ov002_022ce288.count++;
   }
  }
  func_ov002_021ded1c((int)self,-1);
  return 0x7f;
 case 0x7f:
  player=self->side;
  if(data_ov002_022cf178[player & 1].count==0) return 0x7e;
  func_ov002_021d7c1c(player,data_ov002_022cf16c[player & 1].cards,0);
  data_ov002_022ce288.count++;
  return 0x7f;
 case 0x7e:
  player=1-self->side;
  if(data_ov002_022cf178[player & 1].count==0) return 0x7d;
  func_ov002_021d7c1c(player,data_ov002_022cf16c[player & 1].cards,0);
  data_ov002_022ce288.count++;
  return 0x7e;
 case 0x7d:
  func_ov002_021df818(self,1-self->side,data_ov002_022ce288.count*0x12c);
  return 0;
 }
 return 0;
}
