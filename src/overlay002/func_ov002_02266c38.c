typedef unsigned int u32;
typedef unsigned short u16;
struct Card { u32 id:13; u32 flag:1; u32 pad:7; u32 used:1; u32 value:8; u32 tail:2; };
struct Player { char head[0x14]; u32 count; char gap[0x400]; struct Card cards[276]; };
struct Count { u32 count; char tail[0x864]; };
struct State { char pad[0xd28]; int step; };
extern struct State data_ov002_022d016c;
extern struct Player data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02266c38(int player) {
 u32 i;
 struct Card *c;
 u32 packed;
 struct Player *p;
 if(data_ov002_022d016c.step != 0) return 1;
 i=0;
 if(*(u32 *)(data_ov002_022cf180+(player&1)*0x868) > i) {
  p=&data_ov002_022cf16c[player & 1];
  c=p->cards;
  packed=(((u32)player<<31)&0x80000000)|0x44e0000;
  do {
   if(c->id==0x1459 && c->used==0)
    func_ov002_021e30b4(packed | (u16)c->id,(u16)(c->value*2+c->flag),0);
   i++;
   c++;
  } while(i<p->count);
 }
 data_ov002_022d016c.step++;
 return 0;
}


