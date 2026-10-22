typedef unsigned int u32;
typedef struct {
 char pad[0x230]; int x,y; int pad238[2];
 u32 mode:3; u32 rest240:3; u32 sound:1; u32 tail240:25;
 int f244;
 u32 angle:16; u32 tail248:16;
 int pad24c[3];
 u32 distance:10; u32 slot:8; u32 tail258:14;
 u32 low25c:7; u32 timer:8; u32 high25c:17;
 int pad260[4];
 u32 byte270:8; u32 tail270:24;
 int f274;
 u32 low278:4; u32 flag278:1; u32 tail278:27;
} State;
typedef struct { char pad[0x27c]; u32 low:6; u32 sound:1; u32 high:25; } Other;
typedef struct { int x,y; } Point;
extern State data_ov011_021d403c;
extern Other data_ov011_021d4000;
extern Point data_ov011_021d426c;
extern int func_ov011_021d0cac(Point point,int *slot);
extern void func_ov011_021d1080(int id,int *x,int *y);
extern int func_0208c66c(int y,int x);
extern unsigned int func_ov011_021d0ffc(int arg0);
extern unsigned int func_ov011_021d129c(int i);
extern void func_ov011_021d1230(int arg0,int arg1);
extern int func_02018b48(void);
extern int func_ov011_021cf2dc(void);
extern int func_02037be4(int id);
extern int func_02037208(int a0,int r1,int r2,int r3);
extern int func_020380dc(int id,int target,int frames,int relative);
extern int func_02036590(unsigned int id,int arg);
static inline void stopSound(void) {
 State *s=&data_ov011_021d403c;
 if(data_ov011_021d4000.sound) { func_02036590(0x86,0); s->sound=0; }
 s->f244=0;
}
void func_ov011_021cbc1c(void) {
 int slot,x,y;
 int distance;
 State *s=&data_ov011_021d403c;
 distance=func_ov011_021d0cac(data_ov011_021d426c,&slot);
 if(slot!=0) {
  func_ov011_021d1080(slot,&x,&y);
  s->angle=func_0208c66c(y-s->y,x-s->x);
  s->distance=distance>>12;
  s->slot=slot;
  if(func_ov011_021d0ffc(slot)==1) {
   if(s->byte270==0) s->mode=0; else s->mode=3;
  } else if(func_ov011_021d129c(slot)!=0) {
   if(s->distance>25) s->mode=0; else s->mode=3;
  } else {
   s->mode=3;
   if(s->distance>100) { s->mode=0; s->timer=0; }
   else if(s->distance>50) { s->mode=1; s->timer=0; }
   else if(s->distance>25) { s->mode=2; s->timer=0; }
   else {
    s->timer++;
    if(s->timer>=30) { func_ov011_021d1230(slot,1); s->timer=0; }
   }
  }
 }
 switch(s->mode) {
 case 1: case 2:
  if(s->flag278) return;
  if(func_02018b48()!=0) return;
  if(func_ov011_021cf2dc()==0) return;
  if(func_02037be4(0x86)!=0) return;
  func_02037208(0x86,-1,0,1);
  func_020380dc(0x86,0x400-(s->distance<<10)/100,1,0);
  s->sound=1;
  break;
 case 0: case 3:
  stopSound();
  break;
 }
}




