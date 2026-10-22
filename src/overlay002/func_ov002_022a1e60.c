typedef struct { int f0,f4,kind,fc,f10,f14,state,value; } Obj;
typedef struct {
 int f0,mode; unsigned int bits,mask; int f10,kind,pad18[2],index,pad24[10],value;
} Self;
typedef struct {
 int f0, mode, f8, fc, f10, selection, f18, cancel, index, count;
 char pad28[0x18]; int enabled; char pad44[0x1c]; int kind;
 char pad64[0x130]; int options; Obj buttons[3];
} Menu;
typedef struct { char pad[0x52]; unsigned short held, pressed, repeat; } Input;
typedef struct { char pad[0xe64]; unsigned int low:1; unsigned int flag:1; unsigned int rest:30; } Flags;
extern Input data_02104bac;
extern Flags data_021040ac;
extern char data_ov002_022d1a9c[];
extern struct { char pad[0xd0]; int state; } data_ov002_022d0f2c;
/* The division helper returns quotient in r0 and remainder in r1. */
extern long long func_020b3870(int numerator, int denominator);
extern int func_02037208(int a0,int r1,int r2,int r3);
extern void *func_ov002_021afbc4(void);
extern void func_ov002_0229f1e0(Obj *obj);
extern int func_ov002_022a0f8c(Self *self,int i);
extern void func_ov002_022a10fc(Menu *self,int i);
extern void func_ov002_022ad134(Menu *self);
extern void func_ov002_022aeb60(void *self);
void func_ov002_022a1e60(Menu *self)
{
 int oldSelection, oldIndex;
 if(self->mode < 0) { func_ov002_022ad134(self); return; }
 oldIndex=self->index;
 oldSelection=self->selection;
 if ((data_02104bac.pressed & 1) || data_021040ac.flag) {
  if(oldSelection<0) return;
  if(self->enabled && !func_ov002_022a0f8c((Self *)self,oldIndex)) return;
  func_ov002_0229f1e0(&self->buttons[self->selection]); return;
 }
 if(data_02104bac.pressed & 2) {
  if(self->cancel<0) return;
  if(self->enabled && !func_ov002_022a0f8c((Self *)self,oldIndex)) return;
  { int cancel=self->cancel; Obj *button=&self->buttons[cancel]; self->selection=cancel; func_ov002_0229f1e0(button); } return;
 }
 if(data_02104bac.pressed & 0x400) {
  func_ov002_022aeb60(data_ov002_022d1a9c);
  data_ov002_022d0f2c.state=2; return;
 }
 if(data_02104bac.repeat & 0x20) {
  if(self->mode<0) {
   switch(self->kind) {
   case 0: if(oldIndex!=0) { self->index=oldIndex-1; func_ov002_022a10fc(self,self->index); } break;
   case 1: if(oldSelection!=0) self->selection=oldSelection-1; break;
   }
  } else {
   if(self->enabled) { func_ov002_0229f1e0(&self->buttons[0]); return; }
   if(oldSelection<0) self->selection=-(self->options==0);
   else self->selection=(int)(func_020b3870(oldSelection+self->options-1,self->options)>>32);
  }
 } else if(data_02104bac.repeat & 0x10) {
  if(self->mode<0) {
   switch(self->kind) {
   case 0: if(self->index<(int)func_ov002_021afbc4()-1) { self->index++; func_ov002_022a10fc(self,self->index); } break;
   case 1: if(oldSelection<self->options) self->selection=oldSelection+1; break;
   }
  } else {
   if(self->enabled) { func_ov002_0229f1e0(&self->buttons[2]); return; }
   if(oldSelection<0) self->selection=-(self->options==0);
   else self->selection=(int)(func_020b3870(oldSelection+1,self->options)>>32);
  }
 } else if(self->mode==5) {
  if(data_02104bac.repeat & 0xc0) {
   self->index=(int)(func_020b3870(oldIndex+self->count/2,self->count)>>32);
   func_ov002_022a10fc(self,self->index);
  }
 } else if(self->mode==11) {
  if(data_02104bac.held & 0x40) self->index=oldIndex=1;
  if(data_02104bac.held & 0x80) self->index=oldIndex=2;
 }
 if(oldIndex!=self->index || oldSelection!=self->selection) {
  if(self->mode==3) func_02037208(0x48,-1,0,3);
  else func_02037208(0x38,-1,0,3);
 }
}


