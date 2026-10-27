typedef struct { int unused; unsigned int mode:3; unsigned int rest:29; } Global;
typedef struct { short sound; short a; short time; char pad[14]; } Entry;
extern unsigned short data_02104bac[];
extern Global data_02104f4c;
extern char data_ov006_021cec04[];
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov006_021caa64(char *self);
extern void func_ov006_021cab6c(char *self, int x, int y, int *out);
int func_ov006_021c9efc(char *self) {
 int x,y, out[2];
 unsigned short keys = data_02104bac[0x2a], repeat = data_02104bac[0x2b];
 Entry *entry;
 if (((unsigned int)(*(int *)self != 0) <= 0)) return 1;
 *(int *)(self+0x88) = -1;
 if (data_02104f4c.mode == 0) entry = (Entry *)(data_ov006_021cec04 + 6) + *(int *)(self+0x4c);
 else entry = (Entry *)(data_ov006_021cec04 + 0x24a) + *(int *)(self+0x4c);
 if (entry->time > 0 && ++*(int *)(self+0x54) >= entry->time) {
  if (entry->sound != 0) func_02037208(0x91,-1,0,1);
  *(int *)(self+0x48) = -1;
  return 1;
 }
 if (func_02006194() || func_0200617c()) {
  func_02006110(&x,&y);
  func_ov006_021cab6c(self,x,y,out);
  if (func_02006164()) { *(int *)(self+0x80)=out[0]; *(int *)(self+0x84)=out[1]; }
  else if (func_0200617c() && (unsigned int)(out[0] == *(int *)(self+0x80) && out[1] == *(int *)(self+0x84)) > 0 && out[0] == 1) {
   func_02037208(0x3a,-1,0,1); *(int *)(self+0x48)=out[1]; return 1;
  }
  if (out[0] == 1) { *(int *)(self+0x68)=out[1]; *(int *)(self+0x6c)=0; *(int *)(self+0x88)=out[1]; }
  if (*(int *)(self+0x68) != *(int *)(self+0x70) || *(int *)(self+0x6c) != *(int *)(self+0x74)) func_02037208(0x38,-1,0,1);
 } else if (keys & 1) { func_02037208(0x3a,-1,0,1); *(int *)(self+0x48)=*(int *)(self+0x68); return 1; }
 else if (keys & 2) { func_02037208(0x91,-1,0,1); *(int *)(self+0x48)=-1; return 1; }
 else if (repeat & 0xf0) {
  if ((repeat & 0x40) && *(int *)(self+0x64)>0) { if (--*(int *)(self+0x6c)<0) *(int *)(self+0x6c)=*(int *)(self+0x64)-1; }
  else if ((repeat & 0x80) && *(int *)(self+0x64)>0) { if (++*(int *)(self+0x6c)>=*(int *)(self+0x64)) *(int *)(self+0x6c)=0; }
  else if ((repeat & 0x20) && *(int *)(self+0x60)>0) { if (--*(int *)(self+0x68)<0) *(int *)(self+0x68)=*(int *)(self+0x60)-1; }
  else if ((repeat & 0x10) && *(int *)(self+0x60)>0) { if (++*(int *)(self+0x68)>=*(int *)(self+0x60)) *(int *)(self+0x68)=0; }
  if (*(int *)(self+0x68) != *(int *)(self+0x70) || *(int *)(self+0x6c) != *(int *)(self+0x74)) func_02037208(0x38,-1,0,1);
 }
 *(int *)(self+0x70)=*(int *)(self+0x68); *(int *)(self+0x74)=*(int *)(self+0x6c);
 func_ov006_021caa64(self); return 0;
}








