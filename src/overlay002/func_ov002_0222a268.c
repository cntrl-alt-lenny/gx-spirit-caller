typedef unsigned short u16;
struct Node { u16 kind; u16 owner:1; u16 rest:15; };
struct Self022101c4Arg;
struct Card { unsigned id:13; unsigned rest:19; };
struct Player { char pad[0x120]; struct Card cards[80]; char tail[0x608]; };
struct Count { unsigned count; char tail[0x864]; };
struct State { char pad[0x5a8]; int mode; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[];
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern void func_ov002_021e16a4(int player,int id,int all,int flag);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_022101c4(int arg0, struct Self022101c4Arg *self);
extern void func_ov002_0226b054(int arg0);
int func_ov002_0222a268(struct Node *self, u16 *arg) {
 switch(data_ov002_022ce288.mode) {
 case 0x80: func_ov002_022101c4((int)self,(struct Self022101c4Arg *)arg); return 0x7f;
 case 0x7f: func_ov002_021e27c0(1-self->owner,1); return 0x7e;
 case 0x7e: {
 int player=1-self->owner;
 unsigned i;
 unsigned id;
 unsigned count=data_ov002_022cf178[player & 1].count;
 i=0;
 if (i<count) {
 id=*arg;
 do {
 if (data_ov002_022cf16c[player & 1].cards[i].id==id) {
 func_ov002_021d7c1c(player,&data_ov002_022cf16c[player & 1].cards[i],1);
 return 0x7e;
 }
 i++;
 } while(i<count);
 }
 return 0x7d;
 }
 case 0x7d: func_ov002_021e16a4(1-self->owner,*arg,1,1); return 0x7c;
 case 0x7c: func_ov002_0226b054(self->owner); return 0x7b;
 case 0x7b: func_ov002_021e27c0(1-self->owner,0); return 0x7a;
 case 0x7a: func_ov002_021e286c(1-self->owner); return 0;
 }
 return 0;
}


