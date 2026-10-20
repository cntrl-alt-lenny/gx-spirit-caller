struct Ov002Self;
struct Arg { unsigned short id; unsigned short side:1; unsigned short idx:5; unsigned short rest:10; };
struct State { char pad[0x5a8]; int mode; };
struct Index { char pad[0xb0]; unsigned short value; };
struct Command { char pad[0xd70]; int a,b,c; };
extern struct State data_ov002_022ce288;
extern struct Index data_ov002_022d0e6c;
extern struct Command data_ov002_022d016c;
extern void func_ov002_021ae400(int a,int b);
extern int func_ov002_021de4b0(int a,int b,int c);
/* Original caller supplies only two arguments to this four-parameter thunk. */
extern int func_ov002_021e104c();
extern int func_ov002_021e96a0(struct Ov002Self *self,int player,int idx);
/* Original caller supplies only two arguments to this four-parameter thunk. */
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int a,int b,int c);
extern int func_ov002_022593f4(void);
extern void func_ov002_0226ad5c(int a,int b,int c,int d);
/* Original caller omits the unused third parameter. */
extern int func_ov002_0226b258();
int func_ov002_0222c100(struct Arg *self) {
 switch(data_ov002_022ce288.mode) {
 case 0x80:
  func_ov002_0226b258(self->side,self->idx);
  return 0x7f;
 case 0x7f:
  switch(data_ov002_022d0e6c.value) {
  case 1: func_ov002_0226ad5c(self->side,1,0,0); return 0;
  case 2: func_ov002_0226ad5c(1-self->side,1,0,1); return 0;
  case 3: func_ov002_021e104c(self->side,1); return 0;
  case 4: func_ov002_021e104c(1-self->side,1); return 0;
  case 5: return func_ov002_02257878((int)self,(int)func_ov002_021e96a0) ? 0x7e : 0;
  case 6: func_ov002_021de4b0((int)self,self->side,self->idx); return 0;
  default: return 0;
  }
 case 0x7e:
  func_ov002_021ae400(self->side,0x62);
  func_ov002_0225935c(self->side,self->id,(int)func_ov002_021e96a0);
  return 0x7d;
 case 0x7d:
  if (!func_ov002_022593f4()) return 0x7e;
  func_ov002_021de4b0((int)self,data_ov002_022d016c.a,data_ov002_022d016c.b+data_ov002_022d016c.c);
  return 0;
 default: return 0;
 }
}


