typedef unsigned short u16;
typedef unsigned int u32;
struct Node {
 u16 f0;
 u16 player:1; u16 slot:5; u16 kind:6; u16 rest2:4;
 u16 rest4:6; u16 value:9; u16 top4:1;
};
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
struct Entry { struct Key key; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021d59cc(int arg0,int arg1,int arg2,int arg3,unsigned short arg4);
extern int func_ov002_021c1a2c(int player,int slot,int id);
extern void func_ov002_0226b11c(int unused0,int unused1);
/* The fallback forwards incoming r1, unused by the one-argument C callee. */
extern int func_ov002_02216424(struct Node *self, int unused);
int func_ov002_02235a78(struct Node *self, int arg1) {
 if (self->kind==6) {
  int player=self->player;
  int slot=self->slot;
  int value=self->value;
  struct Key *key=&data_ov002_022cf16c[player&1].cards[slot].key;
  if (value != key->a*2+key->b) return 0;
  func_ov002_021d59cc(player,slot,self->f0,5,(u16)(1-player));
  if (func_ov002_021c1a2c(self->player,self->slot,self->f0)) {
   func_ov002_0226b11c(self->player,self->slot);
  }
 } else {
  return func_ov002_02216424(self,arg1);
 }
 return 0;
}

