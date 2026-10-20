typedef struct {
 unsigned short id;
 unsigned short side:1;
 unsigned short rest:15;
 unsigned int pad;
 unsigned short masks[2];
 unsigned short count;
} Self;
typedef struct { char pad[0x5b4]; int state; } State;
typedef struct { char pad[0xd70]; int side, row, extra; } Command;
typedef struct {
 unsigned int pad0:13;
 unsigned int flag:1;
 unsigned int pad1:8;
 unsigned int value:8;
 unsigned int pad2:2;
 char pad[16];
} Entry;
extern State data_ov002_022ce288;
extern Command data_ov002_022d016c;
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_022577dc(void *self);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_021deb84(int arg0, int arg1);
int func_ov002_021f7598(Self *self) {
 int side;
 int row;
 int count;
 unsigned int limit;
 Entry *entry;
 count = func_ov002_022577dc(self);
 limit = *(unsigned int *)(data_ov002_022cf17c + ((1-self->side)&1)*0x868);
 if ((unsigned int)count >= limit) count = limit;
 switch (data_ov002_022ce288.state) {
 case 0:
  self->masks[1]=0;
  self->masks[0]=0;
  self->count=0;
  if (count == 0) return 0;
  func_ov002_021ae400(self->side,0x74);
  data_ov002_022ce288.state++;
  return 0;
 case 1:
  func_ov002_0225935c(self->side,self->id,(int)func_ov002_021e7584);
  data_ov002_022ce288.state++;
  return 0;
 case 2:
  if (func_ov002_022593f4()) {
   side=data_ov002_022d016c.side;
   row=data_ov002_022d016c.row;
   row+=data_ov002_022d016c.extra;
   entry=(Entry *)(data_ov002_022cf16c+(side&1)*0x868+0x30);
   func_ov002_0229ade0(0x28,side,row,entry[row].value*2+entry[row].flag);
   self->masks[side]|=1<<row;
   self->count++;
   if (self->count >= count) data_ov002_022ce288.state++;
   else data_ov002_022ce288.state--;
   return 0;
  }
  if (self->count == 0) {
   func_ov002_0229ade0(0x29,0,0,0);
   data_ov002_022ce288.state=0;
   return 0;
  }
  data_ov002_022ce288.state++;
  return 0;
 case 3:
  func_ov002_021deb84(self->side,self->masks[0]|(self->masks[1]<<16));
  return 1;
 }
 return 0;
}


