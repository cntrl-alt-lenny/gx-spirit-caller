extern char *GetSystemWork(void);
/* Forwarders leave their results in r0 for this caller. */
extern int func_020190ec(void);
extern int func_020139c4(void);
extern unsigned int func_020191cc(void);
extern unsigned short func_02019034(void);
extern int func_02019664(void);
extern unsigned int func_020195ec(void);
extern unsigned int func_0201b7e0(void *obj);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201abb0(int n);
extern void func_0201b7b4(void);
extern void func_02018a38(unsigned int value);
extern void func_02018a64(void);
extern void func_0201b708(int arg);
extern void func_0201b730(int a0);
struct Bit0 { unsigned int b : 1; };
void func_02016cd8(void *o) {
 char *w = GetSystemWork();
 if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
 switch (*(int *)(w + 0x920)) {
 case 1:
  if (func_020190ec() == 0) return;
  if ((int)func_020191cc() < 0x12) return;
  if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
  if (func_020139c4() != 5) return;
  *(int *)((char *)o + 8) = 0x001f0100;
  func_0201aabc(0x78);
  *(int *)(w + 0x900) |= 0x1000000;
  return;
 case 2:
  if (func_0201b7e0(o) != 3) return;
  if (func_02019664() != 0x78) return;
  *(int *)((char *)o + 8) = 0x001f0200;
  func_0201aaf4(0x78);
  func_0201b7b4();
  *(int *)(w + 0x900) &= ~0x1000000;
  return;
 case 3:
  if (func_0201b7e0(o) != 4) return;
  if (func_020139c4() != 0) return;
  if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(w + 0x8dc) + 1))
   *(int *)((char *)o + 8) = 0x001f0300;
  return;
 case 4:
  if (func_020190ec() == 0) return;
  if (func_020139c4() != 5) return;
  *(int *)((char *)o + 8) = 0x001f0400;
  *(int *)(w + 0x900) |= 0x1000000;
  func_02018a38(0x13);
  func_0201b708(0xc);
  return;
 case 5:
  if (func_02019664() != 0x71) return;
  *(int *)((char *)o + 8) = 0x001f0500;
  func_02018a64();
  return;
 case 6:
  switch (*(int *)(w + 0x924)) {
  case 1: *(int *)(w + 0x924) = 6;
  case 6:
   *(int *)((char *)o + 8) = 0x001f0600;
   *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
   return;
  case 5:
   if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
   if (func_020195ec() == 0) { *(int *)((char *)o + 8) = 0x001f0601; return; }
   else { *(int *)((char *)o + 8) = 0x001f0602; return; }
  case 4:
   *(int *)((char *)o + 8) = 0x001f0603;
   *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
   return;
  case 3:
   if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
   if (func_020195ec() == 0) { *(int *)((char *)o + 8) = 0x001f0604; return; }
   else { *(int *)((char *)o + 8) = 0x001f0605; return; }
  case 2:
   *(int *)((char *)o + 8) = 0x001f0606;
   *(int *)(w + 0x900) &= ~0x1000000;
   func_0201b7b4();
   func_0201b730(0xc);
   return;
  }
  break;
 case 7:
  switch (*(int *)(w + 0x924)) {
  case 1: *(int *)(w + 0x924) = 3;
  case 3:
   if (func_020190ec() == 0) return;
   if (func_020139c4() != 5) return;
   *(int *)((char *)o + 8) = 0x001f0700;
   func_0201aabc(0x78);
   *(int *)(w + 0x900) |= 0x1000000;
   return;
  case 2:
   if (func_0201b7e0(o) != 3) return;
   if (func_02019664() != 0x78) return;
   *(int *)((char *)o + 8) = 0x001f0701;
   func_0201abb0(4);
   func_0201aaf4(0x78);
   *(int *)(w + 0x900) &= ~0x1000000;
   return;
  }
  return;
 }
}









