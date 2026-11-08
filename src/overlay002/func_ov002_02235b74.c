typedef unsigned short u16;
typedef unsigned int u32;
struct Node { u16 id; u16 player:1; u16 slot:5; u16 kind:6; u16 rest2:4; u16 pad4:6; u16 value:9; u16 top4:1; u16 f6; u16 count; };
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
struct Entry { struct Key key; u32 f4; u32 f8; u32 mask; u32 f10; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
struct State { char pad[0x5a8]; int phase,count; };
struct Flag { char pad[0xb0]; u16 value; };
extern struct State data_ov002_022ce288;
extern struct Flag data_ov002_022d0e6c;
extern struct Player data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
/* The original forwards incoming r1; the matched callee ignores it. */
extern int func_ov002_02223d48(void *arg0, int unused);
extern int func_ov002_021c2f24(int player,int id);
extern int func_ov002_021d90c0(int flag,int arg1,int arg2);
extern void func_ov002_0226b0b0(int arg0,int arg1,int arg2);
extern void func_ov002_0226b0f0(int arg0,int arg1,int arg2,int arg3);
int func_ov002_02235b74(struct Node *self, int arg1) {
 if(self->kind==20) return func_ov002_02223d48(self,arg1);
 switch(data_ov002_022ce288.phase) {
 case 128: {
 int player=self->player;
 int off=(player&1)*0x868;
 int slot=self->slot;
 int value=self->value;
 struct Key *key=(struct Key *)((char *)data_ov002_022cf16c+off+0x30+slot*20);
 if(value!=key->a*2+key->b) return 0;
 if(*(u16 *)(data_ov002_022cf1a4+off+slot*20)==0) return 0;
 self->count=func_ov002_021c2f24(player,self->id);
 if(self->count==0) return 0;
 func_ov002_0226b0f0(self->player,self->id,self->count,255);
 return 127;
 }
 case 127:
 func_ov002_021d90c0(self->player,self->slot,data_ov002_022d0e6c.value);
 data_ov002_022ce288.count=1;
 return 126;
 case 126:
 for(;data_ov002_022ce288.count<6;data_ov002_022ce288.count++) {
 int player=self->player;
 if(data_ov002_022cf16c[player&1].cards[self->slot].mask & (1<<data_ov002_022ce288.count)) {
 func_ov002_0226b0b0(1-player,self->id,data_ov002_022ce288.count);
 data_ov002_022ce288.count++;
 return 126;
 }
 }
 return 0;
 }
 return 0;
}


