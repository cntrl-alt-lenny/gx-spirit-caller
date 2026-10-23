typedef struct {
 unsigned short top, pos, choice, mode;
 char pad[0xa0];
 unsigned short count, timer;
 int active, cursor, complete, autoOpen, detail;
} State;
typedef struct { char pad[4]; unsigned short busy; char pad6[0x556]; int cancel; } Context;
typedef struct { char pad[0x54]; unsigned short held, pressed; } Input;
extern State data_ov008_021b2de4;
extern Context data_ov008_021b2780;
extern Input data_02104bac;
extern char data_ov008_021b27bc[];
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_0202224c(int idx);
extern int func_02037208(int,int,int,int);
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021aee54(int thr);
extern void func_ov008_021aeeac(void);
extern void func_ov008_021aef18(void);
extern void func_ov008_021af154(int,int);
extern void func_ov008_021afa34(int);
extern void func_ov008_021afbac(void);
extern void func_ov008_021b04c0(void);
#define S data_ov008_021b2de4
#define SUM (S.top + S.pos)
int func_ov008_021b0bc4(void) {
 if (S.timer == 0 && data_ov008_021b2780.busy == 0) {
  if (func_0200617c()) {
   if (data_ov008_021b2780.cancel && S.active == 0) {
    data_ov008_021b2780.cancel = 0;
    func_02037208(0x42,-1,0,1);
    return 1;
   }
   if (S.autoOpen && S.complete == 0 && S.active == 0) {
    S.active = 1;
    func_02037208(0x3a,-1,0,1);
   }
  } else if (func_02006194()) {
   func_ov008_021b04c0();
  } else if (data_02104bac.pressed & 0x80) {
   if (S.pos < (S.count > 3 ? 2 : S.count - 1)) {
    S.pos++;
    func_02037208(0x38,-1,0,1);
   } else if (S.top < S.count - 3) {
    S.top++;
    func_ov008_021af154(1,1);
    func_02037208(0x38,-1,0,1);
   }
   { int a = func_ov008_021aee54(SUM); int b = func_ov008_021aedfc(SUM); int c = func_ov008_021aee54(SUM); if (!(((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32)))) S.choice = 0; }
  } else if (data_02104bac.pressed & 0x40) {
   if (S.pos != 0) {
    S.pos--;
    func_02037208(0x38,-1,0,1);
   } else if (S.top != 0) {
    S.top--;
    func_ov008_021af154(1,0);
    func_02037208(0x38,-1,0,1);
   }
   { int a = func_ov008_021aee54(SUM); int b = func_ov008_021aedfc(SUM); int c = func_ov008_021aee54(SUM); if (!(((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32)))) S.choice = 0; }
  } else if (data_02104bac.pressed & 0x10) {
   int a = func_ov008_021aee54(SUM); int b = func_ov008_021aedfc(SUM); int c = func_ov008_021aee54(SUM);
   if (((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32))) {
    if (S.choice == 5) S.choice = 0; else S.choice++;
    func_02037208(0x38,-1,0,1);
   }
  } else if (data_02104bac.pressed & 0x20) {
   int a = func_ov008_021aee54(SUM); int b = func_ov008_021aedfc(SUM); int c = func_ov008_021aee54(SUM);
   if (((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32))) {
    if (S.choice == 0) S.choice = 5; else S.choice--;
    func_02037208(0x38,-1,0,1);
   }
  } else if (data_02104bac.pressed & 1) {
   if (S.choice == 0) {
    int a = func_ov008_021aee54(SUM); int b = func_ov008_021aedfc(SUM); int c = func_ov008_021aee54(SUM);
    if (!(((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32))) && S.active == 0) {
     func_ov008_021aeeac();
     func_ov008_021afa34(SUM);
     func_02037208(0x3a,-1,0,1);
    }
   }
  } else if (data_02104bac.pressed & 2) {
   if (S.complete) {
    func_02037208(0x42,-1,0,1);
    return 1;
   }
  } else if (data_02104bac.pressed & 0x400) {
   if (S.complete == 0 && S.active == 0) {
    S.autoOpen = 1;
    S.active = 1;
    func_02037208(0x3a,-1,0,1);
   }
  } else if (data_02104bac.pressed & 0x100) {
   if (S.top < S.count - 3) {
    int step = S.count - 3 - S.top;
    if (step > 3) step = 3;
    S.top += step;
    func_ov008_021af154(step,1);
    func_02037208(0x38,-1,0,1);
   }
   { int a = func_ov008_021aee54(SUM); int b = func_ov008_021aedfc(SUM); int c = func_ov008_021aee54(SUM); if (!(((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32)))) S.choice = 0; }
  } else if (data_02104bac.pressed & 0x200) {
   if (S.top != 0) {
    int step = S.top;
    if (step > 3) step = 3;
    S.top -= step;
    func_ov008_021af154(step,0);
    func_02037208(0x38,-1,0,1);
   }
   { int a = func_ov008_021aee54(SUM); int b = func_ov008_021aedfc(SUM); int c = func_ov008_021aee54(SUM); if (!(((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32)))) S.choice = 0; }
  } else if (data_02104bac.held & 0x800) {
   S.detail = 1;
  }
 }
 if (S.active) {
  int cursor = S.cursor;
  if (cursor >= S.count) S.active = 0;
  else {
   int a = func_ov008_021aee54(cursor);
   int b = func_ov008_021aedfc(S.cursor);
   int c = func_ov008_021aee54(cursor);
   if (!(((int *)(data_ov008_021b27bc + b * 52))[c / 32] & (1 << (a % 32)))) {
    int row, index;
    func_ov008_021afa34(S.cursor);
    row = func_ov008_021aedfc(S.cursor);
    index = func_ov008_021aee54(S.cursor);
    ((int *)(data_ov008_021b27bc + row * 52))[index / 32] |= 1 << (func_ov008_021aee54(S.cursor) % 32);
   }
   S.cursor++;
  }
 }
 if (S.timer != 0) {
  S.timer--;
  switch (S.mode) {
  case 1:
   if (S.timer == 0x15f || S.timer == 0x12c || S.timer == 0xf8 || S.timer == 0xc4 || S.timer == 0x90)
    func_02037208(0x35,-1,0,1);
   if (S.timer == 0x72) func_02037208(0x4a,-1,0,1);
   break;
  case 2:
   if (S.timer == 0x19b || S.timer == 0x168 || S.timer == 0x134 || S.timer == 0x100 || S.timer == 0xcc)
    func_02037208(0x35,-1,0,1);
   if (S.timer == 0xae) func_02037208(0x3e,-1,0,1);
   break;
  case 3:
   if (S.timer == 0x19b || S.timer == 0x168 || S.timer == 0x134 || S.timer == 0x100 || S.timer == 0xcc)
    func_02037208(0x35,-1,0,1);
   if (S.timer == 0xae) func_02037208(0x57,-1,0,1);
   break;
  default:
   if (S.timer == 0x19b || S.timer == 0x168 || S.timer == 0x134 || S.timer == 0x100 || S.timer == 0xcc)
    func_02037208(0x35,-1,0,1);
   break;
  }
  switch (S.timer) {
  case 0x1da:
   func_02022234(0,func_0202224c(0) | 2);
   func_02037208(0x33,-1,0,1);
   break;
  case 0x19e:
   if (S.mode == 1) {
    func_02022234(0,func_0202224c(0) | 2);
    func_02037208(0x33,-1,0,1);
   }
   break;
  case 45: {
   int row = func_ov008_021aedfc(SUM);
   int index = func_ov008_021aee54(SUM);
   ((int *)(data_ov008_021b27bc + row * 52))[index / 32] |= 1 << (func_ov008_021aee54(SUM) % 32);
   func_02037208(0x33,-1,0,1);
   S.choice = 1;
   break;
  }
  case 0: func_ov008_021aef18(); break;
  }
  if (data_02104bac.held & 2) {
   func_ov008_021aef18();
   func_02037208(0x43,-1,0,1);
  }
 }
 func_ov008_021afbac();
 return 0;
}


