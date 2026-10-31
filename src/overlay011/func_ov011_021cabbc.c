typedef unsigned int u32;
struct State {
 char pad[0x268];
 u32 low:5; u32 kind:4; u32 high:23;
 u32 unused;
 u32 active:8; u32 rest:24;
 char pad2[12];
 u32 index:8; u32 tail:24;
};
extern struct State data_ov011_021d403c;
extern unsigned char data_ov011_021d3060[];
extern unsigned char data_ov011_021d3138[];
/* The existing void forwarder declaration loses the return value read here. */
extern int func_020139b4(void);
extern int func_0201a3ec(void);
extern int func_0201a498(void);
extern unsigned int func_0201b6e4(int x);
extern int func_ov011_021cd1fc(int arg0);
extern void func_ov000_021af560(int a,int b,int c);
extern void func_ov000_021af4d8(int a,int b,int c);
void func_ov011_021cabbc(int arg0,int arg1) {
 struct State *s = &data_ov011_021d403c;
 int value = func_020139b4();
 int id;
 if (arg0 != -1) value = arg0;
 if (s->active) {
  if (arg1) {
   int n = func_ov011_021cd1fc(s->active);
   func_ov000_021af560(1,(data_ov011_021d3060 + s->kind * 8)[n],value);
  } else {
   int n = func_ov011_021cd1fc(s->active);
   func_ov000_021af4d8(1,(data_ov011_021d3060 + s->kind * 8)[n],value);
  }
 } else {
  id = (data_ov011_021d3138 + 0x3f + s->kind * 16)[s->index];
  if (id == 0x32) {
   if (func_0201a3ec() || func_0201b6e4(0x73)) id = 0x41;
   else if (func_0201a498() || func_0201b6e4(0x74)) id = 0x39;
  }
  if (arg1) func_ov000_021af560(1,id,value);
  else func_ov000_021af4d8(1,id,value);
 }
}

