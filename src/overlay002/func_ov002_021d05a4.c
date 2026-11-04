typedef unsigned short u16;
typedef unsigned int u32;
struct Packed { u16 player:1; u16 kind:5; u16 index:8; u16 flag14:1; u16 flag15:1; };
struct Card { u32 id:13; u32 side:1; u32 other:8; u32 pos:8; u32 top:2; };
struct State { u16 f0,f2,f4,f6; char pad[0x804]; int active,phase,count; struct Card card; };
struct PlayerWord { int value; char pad[0x864]; };
struct Player { char pad[0x260]; int card; char tail[0x604]; };
extern struct State data_ov002_022ce950;
extern struct PlayerWord data_ov002_022cf17c[], data_ov002_022cf18c[], data_ov002_022cf178[];
extern struct Player data_ov002_022cf16c[];
extern int data_ov002_022cf168;
extern u32 data_ov002_022d016c[];
extern void func_ov002_021b91c4(int *dst,const int *src);
extern int func_ov002_021ba4ec(int arg0);
extern int func_ov002_021c988c(int player,int kind,int extra);
extern void func_ov002_021c9b2c(int arg0,int arg1,int arg2);
extern int func_ov002_0229ade0(int cmd,...);
/* Original caller supplies only the command; the definition has three unused parameters. */
extern int func_ov002_0229c7f8();
void func_ov002_021d05a4(void) {
 int player, f2, offset;
 struct Packed b,a;
 player=(data_ov002_022ce950.f0&0x8000)?1:0;
 f2=data_ov002_022ce950.f2;
 switch(data_ov002_022ce950.phase) {
 case 0:
  if(data_ov002_022ce950.f4==0) {data_ov002_022ce950.active=0;return;}
  offset=(player&1)*0x868;
  if(*(int *)((char *)data_ov002_022cf17c+offset)==0) {
   *(int *)((char *)data_ov002_022cf18c+offset)=1;
   data_ov002_022ce950.active=0;return;
  }
  data_ov002_022ce950.phase++;
  if(data_ov002_022d016c[0x33e]==7 && f2==0) return;
  func_ov002_0229ade0(0x3f,player,data_ov002_022ce950.f4,f2);
  break;
 case 1:
  if(func_ov002_0229c7f8(0x3f)) return;
  offset=(player&1)*0x868;
  if(*(int *)((char *)data_ov002_022cf17c+offset)==0) {
   *(int *)((char *)data_ov002_022cf18c+offset)=1;
   data_ov002_022ce950.active=0;return;
  }
  func_ov002_021b91c4(&data_ov002_022cf168,(int *)((char *)data_ov002_022cf16c+offset+0x260));
  func_ov002_021ba4ec(player);
  b.player=(u16)player;
  a.player=(u16)player;
  b.kind=13;
  a.kind=11;
  b.index=0;
  a.index=(u16)(*(int *)((char *)data_ov002_022cf178+offset)-1);
  a.flag15=0;
  b.flag15=0;
  b.flag14=0;
  a.flag14=(u16)func_ov002_021c988c(a.player,a.kind,a.index);
  func_ov002_0229ade0(0x18,(u16)(data_ov002_022ce950.card.pos*2+data_ov002_022ce950.card.side),*(u16 *)&b,*(u16 *)&a);
  data_ov002_022ce950.phase++;
  break;
 case 2:
  if(--data_ov002_022ce950.f4) {data_ov002_022ce950.phase--;return;}
  if((data_ov002_022d016c[0x34]>>2)&1) func_ov002_021c9b2c(player,2,1);
  data_ov002_022ce950.active=0;
  break;
 }
}







