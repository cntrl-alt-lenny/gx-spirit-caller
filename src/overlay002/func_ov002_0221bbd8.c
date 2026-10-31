typedef unsigned short u16;
typedef unsigned char u8;
struct node { u16 kind; u16 owner:1; u16 rest:15; u16 pad4; u16 count; u16 arr8[5]; u16 f18; };
struct Node;
struct State { char pad[0x5a8]; int state; int slot; };
extern struct State data_ov002_022ce288;
extern u16 func_ov002_0223de94(struct node *, int);
extern void func_ov002_021ae400(int, int);
extern int func_ov002_021ba6cc(int, int);
extern int func_ov002_021bd030(int);
extern int func_ov002_021bd110(int, int);
extern int func_ov002_021d5d48(int, int, int, int);
extern void func_ov002_021e16a4(int, int, int, int);
extern int func_ov002_021e1b24(int, int, int);
extern int func_ov002_021e286c(int);
extern int func_ov002_021e797c(struct node *, int, int);
extern int func_ov002_021fe3d4(void);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern void func_ov002_0226b054(int);
int func_ov002_0221bbd8(struct node *self) {
 int pair=func_ov002_0223de94(self,0);
 switch(data_ov002_022ce288.state) {
 case 128:
  if (!func_ov002_021bd110(self->owner,0x13ea) || !func_ov002_0223df38((struct Node *)self,0,0) || !func_ov002_021e797c(self,(u8)pair,(u8)((u16)pair >> 8))) {
  if (func_ov002_021ba6cc(self->owner,0x13ea)) {
   func_ov002_021e16a4(self->owner,0x13ea,0,0); return 1;
  } else { func_ov002_021ae400(self->owner,13); return 120; }
 } else { return 127; }
 case 127: {
  int slot=func_ov002_021bd030(self->owner);
  data_ov002_022ce288.slot=slot;
  func_ov002_021e1b24(self->owner,0x13ea,slot);
  return 126;
 }
 case 126:
  func_ov002_021d5d48(self->owner,(u16)((u8)self->owner | ((u8)data_ov002_022ce288.slot << 8)),(u16)pair,(u8)self->owner); return 125;
 case 125: func_ov002_021fe3d4(); return 1;
 case 120: func_ov002_0226b054(1-self->owner); return 1;
 case 1: func_ov002_021e286c(self->owner); return 0;
 default: return 0;
 }
}

