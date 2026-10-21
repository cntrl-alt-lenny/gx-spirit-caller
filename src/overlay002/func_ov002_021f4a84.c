typedef unsigned short u16;
struct Card {
 u16 id;
 u16 player:1; u16 slot:5; u16 pad:8; u16 other:1; u16 top:1;
 u16 pad4:6; u16 index:9; u16 top4:1;
};
struct State { char pad[0x5b4]; int state; };
struct Result { char pad[0xd44]; int value; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_021fdc08(struct Card *self);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_02257b48(void *p, void *q);
extern int func_ov002_0227ddf8(struct Card *self);
extern int func_ov002_021ae4bc(void *self, int idx);
extern void func_ov002_0226b094(int arg0, int arg1);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
int func_ov002_021f4a84(struct Card *self, void *arg) {
 int player = self->player ^ self->other;
 switch(data_ov002_022ce288.state) {
 case 0:
  if (func_ov002_021fdc08(self)) {
   func_ov002_021ae400(player,0x107);
   return -1;
  }
  if (!func_ov002_02257b48(self,arg)) return -1;
  if (data_ov002_022cd744[player] == 1) {
   data_ov002_022d016c.value = func_ov002_0227ddf8(self);
  } else {
   int message = 0xfa;
   switch(self->id) {
    case 0x10d6: message=0x17; break;
    case 0x10df: message=0x18; break;
    case 0x10e7: message=0x18; break;
    case 0x1294: message=0x2f; break;
    case 0x18ec: message=self->slot == 0xe ? 0x149 : 0x148; break;
   }
   func_ov002_021ae4bc(message,self->index);
  }
  ++data_ov002_022ce288.state;
  return 0;
 case 1:
  if (data_ov002_022d016c.value == 0) {
   switch(self->id) {
    case 0x1445: case 0x17c9: case 0x17cc: case 0x18ec:
    case 0x190a: case 0x197d: case 0x1a28: break;
    default: func_ov002_0226b094(1-player,0x10d6); break;
   }
   ++data_ov002_022ce288.state;
   return 0;
  }
  func_ov002_021df62c(self->player,self->slot,self->index);
  return 1;
 case 2: return -1;
 }
 return 1;
}

