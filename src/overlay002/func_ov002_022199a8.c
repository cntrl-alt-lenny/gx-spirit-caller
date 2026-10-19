typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
 u16 id;
 u16 side:1; u16 slot:5; u16 rest:10;
 u16 pad4:2; u16 flag:1; u16 pad4a:3; u16 value:9; u16 pad4b:1;
} Obj;
typedef struct { u32 lo:13; u32 b:1; u32 mid:8; u32 a:8; u32 hi:2; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern int func_ov002_021d87a4(int arg0,int arg1,int arg2);
extern int func_ov002_021df708(int arg0,int arg1);
extern int func_ov002_021e278c(int arg0,int arg1);
int func_ov002_022199a8(Obj *self) {
 int idx;
 int id;
 Slot *slot;
 if (self->flag) return 0;
 slot = (Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->slot * 0x14);
 if (self->value != slot->a * 2 + slot->b) return 0;
 if (*(u32 *)(data_ov002_022cf178 + ((1-self->side)&1)*0x868) != 0) {
  idx = func_ov002_021b00d0(*(u32 *)(data_ov002_022cf178 + ((1-self->side)&1)*0x868));
  id = ((Slot *)(data_ov002_022cf16c + ((1-self->side)&1)*0x868 + 0x120))[idx].lo;
  func_ov002_021d479c((u16)(((1-self->side) ? 0x8000 : 0) | 0x53),0,0,0);
  slot = (Slot *)(data_ov002_022cf16c + ((1-self->side)&1)*0x868 + 0x120);
  func_ov002_021d87a4(1-self->side,0xb,slot[idx].a*2+slot[idx].b);
  func_ov002_021df708(1-self->side,id);
  slot = (Slot *)(data_ov002_022cf16c + ((1-self->side)&1)*0x868 + 0x120);
  func_ov002_021e278c(1-self->side,slot[idx].a*2+slot[idx].b);
 }
 return 0;
}
