typedef unsigned short u16;
typedef unsigned char u8;
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { u16 prefix[2]; u16 low:2; u16 blocked:1; u16 high:13; struct {u16 lo:8; u16 hi:8;} count; struct Slot slots[5]; u16 start; };
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021b3ac0(int a,int b,int c,int d);
extern int func_ov002_021b3618(int player,int idx);
extern void func_ov002_021d5f2c(int arg0,int arg1);
int func_ov002_022178fc(struct Node *self) {
 int b,a;
 int x,y,z,w;
 if(self->blocked) return 0;
 if(func_ov002_0223df38(self,0,&a) && func_ov002_0223df38(self,1,&b)) {
  x=(u8)a; y=(u8)((u16)a>>8); z=(u8)b; w=(u8)((u16)b>>8);
  if(!func_ov002_0225764c((int)self,x,y)) return 0;
  if(!func_ov002_021b3ac0(x,y,z,w)) return 0;
  if(func_ov002_021b3618(x,y)==b) return 0;
  if(func_ov002_021b3618(x,y)!=0xffff) func_ov002_021d5f2c((u16)a,(u16)b);
 }
 return 0;
}

