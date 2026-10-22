typedef unsigned short u16;
typedef unsigned int u32;
struct Card {
 u16 id;
 u16 player:1; u16 slot:5; u16 tag:6; u16 rest:4;
 u16 pad4:6; u16 index:9; u16 top4:1;
 u16 low6:8; u16 count:8;
 u16 value; u16 value2;
};
struct State { char pad[0x5b4]; int state; };
struct Result { char pad[0xd70]; int player, slot, extra; };
struct Entry { u32 id:13; u32 flag:1; u32 pad:8; u32 level:8; u32 top:2; int other[4]; };
struct Table { char pad[0x30]; struct Entry entries[105]; char end[4]; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern int func_0202b100(int a0);
extern int func_0202b8f0(int unused0);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c848c(int a, int b);
/* Original caller supplies only two arguments to this four-argument thunk. */
extern int func_ov002_021c84e0();
extern void func_ov002_021deb28(int a, int b);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_021ea390(struct Card *, int, int);
extern int func_ov002_021f4a4c(struct Card *self, int unused1);
extern int func_ov002_022575c8(int a0, int a1, int a2);
/* Original caller supplies only two arguments to this four-argument thunk. */
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0229ce5c(char *buf, int format, int text);
int func_ov002_021f52f0(struct Card *self, int arg) {
 char buf[0x200];
 int (*callback)();
 int message;
 int player, slot;
 if (self->tag == 0x23) return 1;
 switch (data_ov002_022ce288.state) {
 case 0:
  message = 0;
  callback = func_ov002_022575c8;
  switch (self->id) {
  case 0xfe0: message=0xfe0; break;
  case 0x167d: message=0xfc9; break;
  case 0x1713: message=0xfc9; break;
  case 0x187e: message=0x13c3; break;
  case 0x192a: callback=func_ov002_021ea390; break;
  case 0x19b5: message=0x18f6; break;
  case 0x1b1e: message=0x194d; break;
  case 0x1b1f: message=0x19a7; break;
  }
  if (!func_ov002_02257878(self,callback)) return 1;
  if (message) {
   func_ov002_0229ce5c(buf,0x13,func_0202b100(message));
   func_ov002_021ae400(self->player, (int)buf);
  } else {
   func_ov002_021ae400(self->player,0x12);
  }
  func_ov002_0225935c(self->player,self->id,(int)callback);
  ++data_ov002_022ce288.state;
  return 0;
 case 1:
  if (func_ov002_022593f4()) {
   slot=data_ov002_022d016c.slot+data_ov002_022d016c.extra;
   player=data_ov002_022d016c.player;
   switch(self->id) {
   case 0xfff: self->value=(func_ov002_021c8470(player,slot)+1)>>1; break;
   case 0x14e4: self->value=func_ov002_021c8470(player,slot); self->count++; break;
   case 0x140b: case 0x15a3: self->value=func_ov002_021c84e0(player,slot); break;
   case 0x1768: self->value=func_ov002_021c84e0(player,slot)+3; self->count++; break;
   case 0x1708: self->value2=func_ov002_021b9ecc(player,slot); break;
   case 0x1927: {
    struct Entry *entry=(struct Entry *)(data_ov002_022cf16c+(player&1)*0x868+0x30);
    self->value2=entry[slot].level*2+entry[slot].flag;
    break;
   }
   case 0x1929: self->value=func_ov002_021c848c(player,slot); break;
   case 0x1855: case 0x19a5:
    self->value=func_ov002_021c848c(player,slot);
    func_ov002_021f4a4c(self,arg); break;
   case 0x1a2b: case 0x1a2c: case 0x1a2d: case 0x1a2e: case 0x1a61: case 0x1aa0:
    func_ov002_021f4a4c(self,arg); break;
   case 0x1af7: {
    struct Entry *entry=(struct Entry *)(data_ov002_022cf16c+(player&1)*0x868+slot*20+0x30);
    self->value=(func_0202b8f0(entry->id)+1)>>1;
    if (self->tag != 0x23) func_ov002_021e276c(self->player,self->id,1,self->index);
    break;
   }
   }
   func_ov002_021deb28(player,slot);
   return 1;
  }
  --data_ov002_022ce288.state;
  return 0;
 }
 return 0;
}


