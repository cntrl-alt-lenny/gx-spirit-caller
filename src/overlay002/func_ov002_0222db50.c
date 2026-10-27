typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Card {
 u16 id;
 u16 side:1, slot:5, kind:6, pad2:2, flipped:1, pad3:1;
 u16 p4:2, blocked:1, p5:3, value:9, p6:1;
 u16 pad[3]; u16 count;
} Card;
struct Entry { u32 id:13, flag:1, pad:8, value:8, tail:2; int rest[4]; };
struct Bank { char pad[0x30]; struct Entry entries[11]; char tail[0x75c]; };
struct State { char pad[0x5a8]; int state; int index; };
extern struct Bank data_ov002_022cf16c[];
struct KindEntry { int kind; int pad[4]; };
struct KindBank { struct KindEntry entries[11]; char tail[0x78c]; };
extern struct KindBank data_ov002_022cf1a8[];
extern struct State data_ov002_022ce288;
extern int func_ov002_021bd030(int self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int func_ov002_021afba0(void);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021d8414(int,int,int,int,int,int,int);
extern int func_ov002_021b3fd8(int,int,int,int);
extern void func_ov002_021df6d4(int,int);
extern int func_ov002_021df818(Card *card,int side,int amount);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_021e1b24(int,int,int);
extern int func_ov002_021d90c0(int flag,int arg1,int arg2);
extern int func_ov002_021bac38(int arg0,int arg1);
extern int func_ov002_021e30b4(int arg0,int arg1,int arg2);
extern int func_ov002_021e27c0(int self_thing,int arg1);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_02211b64(Card *self,int arg1);
int func_ov002_0222db50(Card *self, int arg1) {
 int side, slot, kind, card, dest;
 struct Entry *entry;
 if (self->blocked) return 0;
 if (self->kind == 5) {
  side = self->side;
  slot = self->slot;
  kind = data_ov002_022cf1a8[side & 1].entries[slot].kind;
  card = 1;
  dest = func_ov002_021bd030(side);
  if (self->value != data_ov002_022cf16c[self->side & 1].entries[self->slot].value * 2 + data_ov002_022cf16c[self->side & 1].entries[self->slot].flag) return 0;
  switch (kind) { case 0: card = 0x17ae; break; case 1: card = 0x17ad; break; }
  switch (data_ov002_022ce288.state) {
  case 128:
   if (func_ov002_0225368c(self->side,self->id,card) == 0) {
    func_ov002_021ae400(self->side,13); return 0;
   } else {
    func_ov002_021ae400(side,246); data_ov002_022ce288.index=1; return 127;
   }
  case 127:
   func_ov002_021af9d0(self->side,6,self->id,card); return 126;
  case 126:
   switch (func_ov002_021afba0()) {
   case 11:
    entry = (struct Entry *)func_ov002_021afb74();
    slot = ((struct Entry *)func_ov002_021afb74())->value * 2 + entry->flag;
    func_ov002_021d8414(side,11,slot,side,dest,1,0);
    if (func_ov002_021b3fd8(side,11,0x1379,slot) != 0) {
     func_ov002_021df6d4(side,0x1379); func_ov002_021df818(self,side,2000);
    }
    if (data_ov002_022ce288.index != 0) func_ov002_021e286c(side);
    break;
   case 13:
    func_ov002_021e1b24(side,(u16)card,dest); func_ov002_021e286c(side); break;
   }
   return 120;
  case 120:
   if (kind < 2) func_ov002_021d90c0(side,slot,kind+1);
   if (func_ov002_021bac38(side,0x17ae) >= 0 && func_ov002_021bac38(side,0x17ad) >= 0) {
    func_ov002_021e30b4(((side << 31) & 0x80000000) | 0x200000 | ((slot << 16) & 0x1f0000) | self->id,(u16)(data_ov002_022cf16c[side & 1].entries[slot].value * 2 + data_ov002_022cf16c[side & 1].entries[slot].flag),0);
   }
   return 0;
  case 110: func_ov002_021e27c0(side,1); return 109;
  case 109: func_ov002_0226b054(1-side); return 108;
  case 108: func_ov002_021e27c0(side,0); return 100;
  case 100: func_ov002_021e286c(side); return 0;
  }
 } else if (self->count != 0) return func_ov002_02211b64(self,arg1);
 return 0;
}


