typedef struct {
 unsigned short id;
 unsigned short side:1;
 unsigned short index:5;
 unsigned short rest:10;
 unsigned int pad;
 unsigned short masks[2];
 unsigned short count;
} Self;
typedef struct { char pad[0x5b4]; int state; } State;
typedef struct { char pad[0xd6c]; int side, row, index, extra; } Command;
extern State data_ov002_022ce288;
extern Command data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021ded30(unsigned short *p, int arg1);
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
extern int func_ov002_022575c8(int a0, int a1, int a2);
/* This call site supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_02259774(int bit0, int val5, int val8, int flag);
int func_ov002_021f72f8(Self *self, Self *other) {
 int row, index, extra;
 switch (data_ov002_022ce288.state) {
 case 0:
  self->masks[1]=0;
  self->masks[0]=0;
  self->count=0;
  func_ov002_021ae400(self->side,0x3a);
  data_ov002_022ce288.state++;
 case 1:
  if (data_ov002_022cd744[self->side] == 1 && self->side == other->side && func_ov002_022575c8((int)self,other->side,other->index)) {
   data_ov002_022d016c.side=self->side;
   func_ov002_02259774(other->side,other->index,0,0xb);
   data_ov002_022ce288.state++;
   return 0;
  }
  func_ov002_0225935c(self->side,self->id,(int)func_ov002_021e7584);
  data_ov002_022ce288.state++;
  return 0;
 case 2:
  if (func_ov002_022593f4()) {
   row=data_ov002_022d016c.row;
   index=data_ov002_022d016c.index;
   extra=data_ov002_022d016c.extra;
   self->count++;
   index += extra;
   self->masks[row] |= 1 << index;
   if (data_ov002_022cd744[self->side] == 1) {
    data_ov002_022ce288.state++;
    return 0;
   }
   if (func_ov002_02257878((int)self,(int)func_ov002_021e7584) == 0) {
    data_ov002_022ce288.state++;
    return 0;
   }
   data_ov002_022ce288.state--;
   return 0;
  }
  if (self->count == 0) {
   data_ov002_022ce288.state=0;
   return 0;
  }
  data_ov002_022ce288.state++;
  return 0;
 case 3:
  func_ov002_021ded30((unsigned short *)self,self->masks[0]|(self->masks[1]<<16));
  self->masks[0]=self->count;
  data_ov002_022ce288.state++;
  return 0;
 }
 return 1;
}


