typedef unsigned short u16;
typedef unsigned int u32;
struct Node {
 u16 f0;
 u16 player:1; u16 slot:5; u16 rest2:10;
 u16 rest4:6; u16 value:9; u16 top4:1;
};
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
struct State { char pad[0x5a8]; int phase; };
struct Work { char pad[0xd44]; u32 value; };
struct Flag { char pad[0xb2]; u16 value; };
extern struct State data_ov002_022ce288;
extern struct Work data_ov002_022d016c;
extern struct Flag data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021ae664(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021d93e0(int a,int b,int c);
extern void func_ov002_0226b22c(int arg0,int arg1,int arg2,int arg3);
int func_ov002_02235948(struct Node *self) {
 int player=self->player;
 int slot=self->slot;
 struct Key *key=(struct Key *)(data_ov002_022cf16c+(player&1)*0x868+0x30+slot*0x14);
 if(self->value != key->a*2+key->b) return 0;
 if(*(u16 *)(data_ov002_022cf1a4+(player&1)*0x868+slot*0x14)==0) return 0;
 switch(data_ov002_022ce288.phase) {
 case 128:
  if(data_ov002_022cd744[player]==1) data_ov002_022d016c.value=func_ov002_021b00d0(2);
  else func_ov002_021ae664(0x38);
  return 127;
 case 127:
  func_ov002_0226b22c(player,slot,1,data_ov002_022d016c.value);
  return 126;
 case 126:
  if(data_ov002_022d0e6c.value==0) func_ov002_021d93e0(player,slot,-1);
  return 0;
 }
 return 0;
}
