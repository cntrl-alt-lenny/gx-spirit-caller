struct Arg1 { unsigned short f0; unsigned short flags; char pad[20]; };
struct State { char p0[0x484]; int index; char p1[0x14c]; int active; char p2[0xbc]; int step; int special; };
struct Global { char p0[0xd44]; int ready; char p1[8]; int status; int retry; char p2[12]; int choice; char p3[8]; int a; int b; int c; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern void *data_ov002_022cd73c[];
extern int data_ov002_022cd744[];
extern struct Arg1 data_ov002_022ce588[];
extern char data_ov002_022cacbc[];
extern int func_0202b100(int a0);
extern int func_0202e234(int x);
extern int func_ov002_021ae4a0(int x, int y);
extern void func_ov002_021b1458(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_02245dd4(int player,int mode);
extern int func_ov002_02245f18(struct Arg1 *card,int player,int mode);
extern void func_ov002_022461d8(unsigned short *self);
extern void func_ov002_022592b8(int arg);
extern int func_ov002_0228c1d0(void *player,void *arg1);
extern int func_ov002_0228c330(int player,struct Arg1 *arg1);
extern void func_ov002_0229cd88(void *self,unsigned int arg1);
extern void func_ov002_0229cdb8(void *self,unsigned int arg1);
extern void func_ov002_0229ce5c(char *dst,const char *fmt,const char *str);
int func_ov002_02246a50(void) {
 char buf[0x100];
 struct Arg1 *card;
 void *player = data_ov002_022cd73c[1];
 card = 0;
 int mode;
 if (data_ov002_022ce288.special != 0)
  card = &data_ov002_022ce588[data_ov002_022ce288.index - 1];
 switch (data_ov002_022ce288.step) {
 case 0:
  if (data_ov002_022cd744[(int)player] == 1) {
   if (data_ov002_022ce288.special != 0) {
    if (func_ov002_02245f18(card,(int)player,1) != 0 && func_ov002_0228c330((int)player,card) != 0) {
     data_ov002_022ce288.step = 4;
     return 0;
    }
   } else {
    if (func_ov002_02245dd4((int)player,1) != 0 && func_ov002_0228c1d0(player,0) != 0) {
     data_ov002_022ce288.step = 4;
     return 0;
    }
   }
   func_ov002_021b1458(0x10,0,0,0);
   return 1;
  }
  data_ov002_022ce288.step++;
 case 1: case 5:
  if (data_ov002_022ce288.special != 0) {
   if (func_ov002_02245f18(card,(int)player,0) == 0) {
    func_ov002_0229cd88(buf,0xcd);
    func_ov002_0229cdb8(buf,(unsigned int)data_ov002_022cacbc);
    func_ov002_0229cdb8(buf,0xce);
    mode = 0;
   } else {
    if (func_0202e234(card->f0) != 0) {
     func_ov002_0229ce5c(buf,(const char *)7,(const char *)func_0202b100(card->f0));
     mode = func_ov002_02245f18(card,(int)player,1) + 1;
    } else {
     func_ov002_0229ce5c(buf,(const char *)8,(const char *)func_0202b100(card->f0));
     mode = func_ov002_02245f18(card,(int)player,1) + 1;
    }
   }
  } else {
   if (func_ov002_02245dd4((int)player,0) == 0) {
    func_ov002_0229cd88(buf,0xcc);
    func_ov002_0229cdb8(buf,(unsigned int)data_ov002_022cacbc);
    func_ov002_0229cdb8(buf,0xce);
    mode = 0;
   } else {
    func_ov002_022461d8((unsigned short *)buf);
    mode = func_ov002_02245dd4((int)player,1) + 1;
   }
  }
  if (data_ov002_022ce288.step == 5) mode = 3;
  func_ov002_021ae4a0((int)buf,mode);
  data_ov002_022ce288.step = 2;
  return 0;
 case 2:
  if (data_ov002_022d016c.ready == 0) {
   func_ov002_021b1458(0x10,0,0,0);
   data_ov002_022ce288.active = 0;
   return 1;
  }
  data_ov002_022ce288.step++;
  data_ov002_022d016c.status = 0;
  return 0;
 case 3:
  if (data_ov002_022ce288.special != 0) func_ov002_022592b8(5);
  else func_ov002_022592b8(4);
  data_ov002_022ce288.step++;
  return 0;
 case 4:
  if (data_ov002_022d016c.status == 0) {
   data_ov002_022ce288.step = 5;
   return 0;
  }
  if (data_ov002_022d016c.choice != 3) {
   data_ov002_022d016c.retry = 1;
   data_ov002_022ce288.step--;
   return 0;
  }
  data_ov002_022d016c.status = 0;
  data_ov002_022ce288.step = 10;
  return 0;
 case 10:
  if (data_ov002_022ce288.special != 0)
   func_ov002_021b1458(0x11,(unsigned short)data_ov002_022d016c.a,(unsigned short)data_ov002_022d016c.b,(unsigned short)data_ov002_022d016c.c);
  else
   func_ov002_021b1458(0xe,(unsigned short)data_ov002_022d016c.a,(unsigned short)data_ov002_022d016c.b,(unsigned short)data_ov002_022d016c.c);
  return 1;
 }
 return 1;
}

