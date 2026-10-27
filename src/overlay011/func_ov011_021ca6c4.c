typedef unsigned int u32;
struct Source { char pad[0x2bc]; u32 a:8; u32 active:1; u32 rest:23; };
struct State {
 char pad[0x264]; int mode;
 u32 a:5; u32 kind:4; u32 b:4; u32 effect:4; u32 c:15;
 signed int value:16; u32 upper:16;
 char pad2[0x10];
 union { u32 raw; struct { u32 flags:18; u32 phase:4; u32 tail:10; } bits; } status;
};
extern struct Source data_ov011_021d4000;
extern struct State data_ov011_021d403c;
extern short data_020bef80[][2];
extern void func_ov000_021ab4bc(int idx, int val);
extern void func_ov000_021ab4ec(int idx, int val);
extern void func_ov000_021ab5d8(int idx, int a, int b);
extern void func_ov000_021ab62c(int idx, int a, int b);
extern void func_ov000_021ab688(int idx, int a, int b);
void func_ov011_021ca6c4(void) {
 struct State *p = &data_ov011_021d403c;
 int v;
 if (data_ov011_021d4000.active) {
  if (p->mode == 0 && p->kind) {
   p->value += 42;
   if (p->value > 0) {
    if (p->value >= 255) {
     p->value = 255;
     p->status.raw &= ~0x100;
    }
    v = (data_020bef80[((p->value << 14) / 255) >> 4][0] * 16) >> 12;
    func_ov000_021ab62c(0,63,63);
    func_ov000_021ab5d8(0,8,2);
    func_ov000_021ab688(0,v,16-v);
   }
  } else { p->status.raw &= ~0x100; }
  func_ov000_021ab4bc(0,p->mode == 1 ? 1 : 8);
 }
 if (p->mode != 1) return;
 if (p->effect) {
  switch(p->status.bits.phase) {
  case 1:
   func_ov000_021ab62c(0,63,63);
   func_ov000_021ab5d8(0,1,2);
   func_ov000_021ab4bc(0,1);
   p->status.bits.phase++;
  case 2:
   p->value += 2;
   if(p->value > 255) p->value=0;
   v = p->value;
   if(v >= 0) {
    v = (data_020bef80[((v << 15) / 255) >> 4][0] * 10) >> 12;
    func_ov000_021ab688(0,v,16-v);
   }
   break;
  case 3:
   v = p->value - 32;
   if(v < 0) {
    v=0;
    p->status.bits.phase=0;
    func_ov000_021ab4ec(0,1);
   }
   {
    int blend;
    p->value=v;
    blend = data_020bef80[((v << 15) / 255) >> 4][0];
    blend = (blend * 10) >> 12;
    func_ov000_021ab688(0,blend,16-blend);
   }
   break;
  }
 } else {
  func_ov000_021ab4ec(0,1);
  if(p->status.bits.phase == 2) {
   p->status.bits.phase=1;
   p->value=0;
  }
 }
}





