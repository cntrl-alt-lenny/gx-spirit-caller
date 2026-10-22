typedef unsigned int u32;
struct State {
 char pad[0x264];
 int mode;
 u32 f268;
 u32 f26c;
 u32 f270;
 unsigned low274:13; unsigned stage:8; unsigned high274:11;
 unsigned kind:4; unsigned rest278:28;
 u32 f27c, f280;
 unsigned low284:20; unsigned busy:8; unsigned flag:1; unsigned high284:3;
};
struct MainState { char pad[0x2b0]; unsigned low:13; unsigned stage:8; unsigned high:11; };
extern struct State data_ov011_021d403c;
extern struct MainState data_ov011_021d4000;
extern char *GetSystemWork(void);
extern int func_02018b48(void);
extern void func_0201b7fc(void);
extern int func_0201be98(void);
extern int func_0201bf4c(void);
extern void func_0201c198(int value);
extern int func_ov000_021ab6cc(void);
extern void func_ov000_021ab740(int a, int b);
extern void func_ov011_021ca600(void);
extern void func_ov011_021cb218(void);
extern void func_ov011_021cc3d4(void);
extern void func_ov011_021ccf3c(void);
extern void func_ov011_021cd638(void);
extern void func_ov011_021cf2b8(void);
extern int func_ov011_021cf2dc(void);
extern void func_ov011_021cfaf8(int v);
extern void func_ov011_021cfbcc(void);
extern unsigned int func_ov011_021cff48(void);
extern void func_ov011_021cff9c(int arg0);
extern void func_ov011_021d1b70(int idx);
extern int func_ov011_021d1d18(void);
int func_ov011_021cffe4(void) {
 struct State *s = &data_ov011_021d403c;
 int result = 0;
 switch (data_ov011_021d4000.stage) {
 case 0:
  func_0201b7fc();
  if (s->busy) s->stage = 0x16;
  else if (s->kind == 2) {
   func_ov011_021cf2b8();
   s->stage = 0x14;
  } else {
   func_0201c198(5);
   if (s->mode == 1 && (func_0201be98() || func_0201bf4c())) func_ov011_021cff9c(1);
   else func_ov011_021cfaf8(1);
  }
  func_ov011_021cb218();
  func_ov011_021cd638();
  break;
 case 0x14:
  if (s->flag && !s->busy) {
   func_ov011_021cf2b8();
   s->flag = 0;
  } else if (func_ov011_021cf2dc() && !s->busy) {
   if (func_02018b48()) {
    if (!((*(u32 *)(GetSystemWork()+0x900) << 20) >> 31)) func_ov000_021ab740(0,16);
    s->stage++;
   } else {
    func_0201c198(5);
    if (func_0201be98() || func_0201bf4c()) s->stage = 0;
    else {
     if (s->kind == 2) {
      func_ov011_021ca600();
      func_ov011_021cc3d4();
      s->f268 &= ~0xf;
      func_ov011_021ccf3c();
      s->f270 &= ~0x10000000;
     }
     func_ov011_021cfaf8(1);
     s->kind = 0;
    }
   }
  }
  func_ov011_021cb218();
  func_ov011_021cd638();
  break;
 case 0x15:
  if (func_ov000_021ab6cc()) result = 1;
  func_ov011_021cb218();
  func_ov011_021cd638();
  break;
 case 0x16:
  if (func_ov000_021ab6cc()) {
   if (!s->flag) func_ov011_021d1b70(func_ov011_021cff48());
   s->flag = 1;
   if (!s->busy && !func_ov011_021d1d18()) s->stage = 0x14;
  }
  func_ov011_021cb218();
  func_ov011_021cd638();
  break;
 default:
  func_ov011_021cfbcc();
  break;
 }
 return result;
}
