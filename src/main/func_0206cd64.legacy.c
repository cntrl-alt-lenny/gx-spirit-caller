typedef signed char s8;
typedef unsigned short u16;
struct Inner0206 {
 char pad[0xf8]; int f_f8; u16 f_fc; s8 f_fe;
};
struct S0206cf {
 char pad0[8]; unsigned char f_8; char pad1[0x64-9];
 struct Inner0206 *f_64; char pad2[0x73-0x68]; s8 f_73;
};
typedef struct S0206cf arg_0206ccbc_t;
typedef struct { char pad0[4]; struct S0206cf *f4; char pad1[8]; int f10; unsigned int f14; u16 *f18; int *f1c; } Request;
extern void *func_0206ccbc(arg_0206ccbc_t *arg);
extern int func_0206cfa0(struct S0206cf *a, int b, int c, u16 *d, int *e);
extern void func_0207092c(int a);
extern int func_02070a38(int *out);
extern void func_02091768(unsigned int a);
extern void func_02094688(int a, int b, int c);
int func_0206cd64(Request *arg) {
 unsigned int length;
 struct S0206cf *p = arg->f4;
 struct Inner0206 *inner = p->f_64;
 int dest = arg->f10;
 length = arg->f14;
 u16 *out1 = arg->f18;
 int *out2 = arg->f1c;
 int base = inner->f_f8;
 int count;
 int result;
 for (;;) {
  int flag;
  result = func_02070a38(&count);
  if (result == 0 || count - base > 0) break;
  flag = 1;
  if (p->f_73 == 0) { }
  else if (p->f_73 != 4) flag = 0;
  if (flag != 0) {
   if (p->f_8 != 4) { result = 0; break; }
  }
  func_02091768(10);
 }
 if (p->f_73 == 4) {
  if (result == 0) return 0;
  if (length > (unsigned int)count) length = count;
  func_02094688(result, dest, length);
  func_0207092c(length);
  return length;
 }
 if (result == 0) result = 0;
 else result = func_0206cfa0(p, dest, length, out1, out2);
 if (result <= 0) return result;
 if (inner->f_f8 >= inner->f_fc) func_0206ccbc(p);
 return result;
}


