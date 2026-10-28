typedef long long s64;
struct State {
 char pad0[0x1fc]; int x,y; char pad1[0x18];
 int startX,startY,deltaX,deltaY; char pad2[4]; int targetX,targetY;
 char pad3[8]; unsigned type:3; unsigned rest240:29;
 char pad4[0x14]; unsigned unused258:10; unsigned id:8; unsigned rest258:14;
 char pad5[8]; int active; char pad6[8];
 unsigned low270:20; unsigned mode:8; unsigned flag:1; unsigned high270:3;
 unsigned alpha:8; unsigned gap274:5; unsigned lock:8; unsigned high274:11;
};
extern struct State data_ov011_021d403c;
extern short data_020bef80[];
extern int func_ov011_021c9dd8(void);
extern int func_ov011_021c9e2c(void);
extern void *func_ov011_021cc374(void);
extern void func_02006110(int *,int *);
extern void func_ov011_021d1080(int,int *,int *);
extern void func_ov011_021ccf3c(void);
extern void func_ov011_021cca04(void);
extern int func_ov011_021cf0a4(void);
void func_ov011_021ccb6c(void) {
 struct State *s=&data_ov011_021d403c;
 int x,y,tx,ty; int a,angle,scale;
 if(func_ov011_021c9dd8()!=0 && func_ov011_021cc374()==0 && s->lock==0) {
  if(s->active!=1) return;
  if(s->type==3) {
   func_ov011_021d1080(s->id,&tx,&ty);
   s->targetX=tx; s->targetY=ty;
  } else {
   func_02006110(&x,&y);
   s->targetX=(x<<12)+s->x; s->targetY=(y<<12)+s->y;
  }
  func_ov011_021ccf3c();
  s->flag=0;
 } else if(func_ov011_021c9e2c()!=0 && func_ov011_021cc374()==0 && s->lock==0) {
  func_02006110(&x,&y);
  if(x>=224 && x<256) s->x+=0x4000-(((256-x)<<14)/32);
  else if(x>=0 && x<32) s->x-=0x4000-((x<<14)/32);
  if(y>=160 && y<192) s->y+=0x4000-(((192-y)<<14)/32);
  else if(y>=0 && y<32) s->y-=0x4000-((y<<14)/32);
  func_ov011_021cca04();
  if(s->active!=1) return;
  s->targetX=(x<<12)+s->x; s->targetY=(y<<12)+s->y;
 } else {
  if(s->mode!=0 || func_ov011_021cf0a4()==0) {
   a=s->mode-4;

   if(a<0) a=0;
   scale=((255-a)<<14)/255;
   scale=0x1000-data_020bef80[(scale>>4)*2];
   s->x=s->startX+(int)(((s64)s->deltaX*scale+0x800)>>12)-0x80000;
   s->y=s->startY+(int)(((s64)s->deltaY*scale+0x800)>>12)-0x60000;
   s->mode=a;
  } else if(s->alpha!=0) {
   a=s->alpha-4;

   if(a<0) a=0;
   scale=((255-a)<<14)/255;
   scale=0x1000-data_020bef80[(scale>>4)*2];
   s->x=s->targetX+(int)(((s64)s->deltaX*scale+0x800)>>12)-0x80000;
   s->y=s->targetY+(int)(((s64)s->deltaY*scale+0x800)>>12)-0x60000;
   s->alpha=a;
  } else { switch(s->flag) { case 0: if(s->active==1) {
   s->x=s->targetX-0x80000; s->y=s->targetY-0x60000; } break; }
  }
  func_ov011_021cca04();
 }
}








