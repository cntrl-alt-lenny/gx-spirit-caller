typedef unsigned short u16;
typedef unsigned int u32;
struct Obj {
 u16 id;
 u16 side:1; u16 rest2:15;
 u16 pad4:2; u16 disabled:1; u16 rest4:13;
};
struct Slot { u32 id:13; u32 rest:19; char pad[4]; u16 active; char tail[10]; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
struct Player { char pad[0x30]; struct Slot slots[5]; char tail[0x7d4]; };
extern struct Player data_ov002_022cf16c[];
extern char *func_0202b830(int idx);
extern void func_ov002_021ae430(int a, const char *src);
extern int func_ov002_021c93cc(int a, int b, int bit);
extern int func_ov002_021de408(int a, int b);
extern void func_ov002_0226b0f0(int arg0, int arg1, int arg2, int arg3);
int func_ov002_0221a858(struct Obj *self) {
 int i, j, side, bit, mask;
 struct Slot *slot;
 if (self->disabled) return 0;
 switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
 case 0x80:
  func_ov002_0226b0f0(self->side, self->id, 2, 0xff);
  return 0x7f;
 case 0x7f:
  func_ov002_0226b0f0(1-self->side, self->id, 1, *(u16 *)(data_ov002_022d0e6c+0xb0));
  return 0x7e;
 case 0x7e:
  func_ov002_021ae430(self->side, func_0202b830(*(u16 *)(data_ov002_022d0e6c+0xb2)));
  return 0x7d;
 case 0x7d:
  bit = *(u16 *)(data_ov002_022d0e6c+0xb2);
  mask = 0;
  for (i=0;i<2;i++) {
   if (i) side=self->side; else side=1-self->side;
   for (j=0;j<5;j++) {
    
    if (data_ov002_022cf16c[side&1].slots[j].id && data_ov002_022cf16c[side&1].slots[j].active) {
     if (func_ov002_021c93cc(side,j,bit)) mask |= 1 << (side*16+j);
    }
   }
  }
  func_ov002_021de408((int)self,mask);
  return 0;
 }
 return 0;
}

