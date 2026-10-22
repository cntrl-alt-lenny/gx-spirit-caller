typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id, f2; u16 pad4:2, blocked:1, rest4:13; u16 f6; u16 counts[2], masks[2]; };
struct Ctrl { char pad[0x5a8]; int state, turn, flags; };
struct Global { char pad[0xcec]; int player; };
struct Record { u32 card:13, bit:1, rest:18; };
struct Slot { struct Record rec; char pad[16]; };
struct Row { char pad[12]; u32 count; char pad2[32]; struct Slot slots[5]; char tail[0x7d4]; };
struct Count { u32 count; char pad[0x864]; };
struct Select { char pad[0xb0]; u16 slot; };
extern struct Ctrl data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern struct Row data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern struct Select data_ov002_022d0e6c;
extern int func_0202e234(int x);
extern int func_0202e2c8(int unused0);
extern int func_0202e2f8(int unused0);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021c9df0(int arg);
/* The original passes only r0 to this four-parameter thunk. */
extern int func_ov002_021ca2b8();
extern void func_ov002_021d8840(unsigned player, unsigned mask);
extern int func_ov002_021de9c0(int a, int b);
extern int func_ov002_021e27c0(int self_thing, int arg1);
/* The original omits this function's unused parameter. */
extern void func_ov002_021e2b3c();
/* The original omits this function's unused parameter. */
extern void func_ov002_021e2c5c();
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern void func_ov002_0226b094(int arg0, int arg1);
extern void func_ov002_0226b0b0(int arg0, int arg1, int arg2);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_02218aa0(struct Self *self) {
 int player = data_ov002_022d016c.player ^ data_ov002_022ce288.turn;
 int i, j, mask, id, offset;
 struct Slot *slot;
 struct Row *row;
 switch(data_ov002_022ce288.state) {
 case 0x80:
  if(self->blocked) return 0;
  self->counts[1]=0; self->counts[0]=0; self->masks[1]=0; self->masks[0]=0;
  mask=func_ov002_021de9c0((int)self,0x1f001f);
  for(i=0,offset=0;i<2;i++,offset+=16) {
   slot=data_ov002_022cf16c[i&1].slots;
   for(j=0;j<5;j++,slot++) {
    if(mask & (1<<(j+offset))) {
     id=slot->rec.card;
     if(func_0202e234(id)!=0 && func_0202e2f8(id)==0 && func_0202e2c8(id)==0) self->counts[slot->rec.bit]++;
    }
   }
  }
  return 0x7f;
 case 0x7f:
  data_ov002_022ce288.turn=0;
  data_ov002_022ce288.flags=func_ov002_021ca2b8(0)|func_ov002_021c9df0(0);
  data_ov002_022ce288.flags|=(func_ov002_021ca2b8(1)|func_ov002_021c9df0(1))<<1;
  func_ov002_021e2b3c(); return 0x7e;
 case 0x7e:
  if(self->counts[player]!=0 && func_ov002_021bc618(player)!=0 && ((data_ov002_022ce288.flags>>player)&1)) {
   j=0; if(j<*(u32 *)(data_ov002_022cf178+(player&1)*0x868)) { row=&data_ov002_022cf16c[player&1]; do {
    if(func_ov002_0225368c(player,self->id,j)) return 0x7d;
   } while(++j<row->count); }
   func_ov002_021e27c0(player,1); return 0x79;
  }
  return 0x78;
 case 0x7d:
  func_ov002_0226b094(player,self->id); return 0x7c;
 case 0x7c:
  j=0; if(j<*(u32 *)(data_ov002_022cf178+(player&1)*0x868)) { row=&data_ov002_022cf16c[player&1]; do {
   if(func_ov002_0225368c(player,self->id,j)) {
    func_ov002_0226afb4(player,self->id); return 0x7b;
   }
  } while(++j<row->count); }
  func_ov002_021e27c0(player,1); return 0x79;
 case 0x7b:
  func_ov002_0227ac64(player, (struct Record *)((char *)&data_ov002_022cf16c[player&1]+0x120)+data_ov002_022d0e6c.slot,0,1,0);
  self->counts[player+2] |= 1<<func_ov002_021bc6c4(player);
  self->counts[player]--;
  return self->counts[player]!=0 ? 0x7c:0x78;
 case 0x79:
  func_ov002_0226b0b0(1-player,self->id,1); return 0x78;
 case 0x78:
  func_ov002_021e27c0(player,0);
  data_ov002_022ce288.turn++;
  return data_ov002_022ce288.turn<2 ? 0x7e:0x77;
 case 0x77:
  for(i=0;i<2;i++) { player=data_ov002_022d016c.player^i; func_ov002_021d8840(player,self->masks[player]); }
  func_ov002_021e2c5c(); return 0;
 default: return 0;
 }
}



