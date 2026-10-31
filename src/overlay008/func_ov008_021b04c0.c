typedef struct { unsigned short top, pos, choice; char pad[0xa2]; unsigned short count, timer; int active, cursor, complete, autoOpen, detail; } State;
typedef struct { char pad[0x55c]; int cancel; char pad560[0xd4]; unsigned int flags; } Context;
typedef struct { char pad[0x58]; unsigned short repeat; } Input;
extern State data_ov008_021b2de4;
extern Context data_ov008_021b2780;
extern Input data_ov008_021b2c80;
extern unsigned int data_ov008_021b27bc[][13];
extern void func_02006110(int *, int *);
extern unsigned int func_02006164(void);
extern int func_ov008_021aa578(int,int,int,int);
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021aee54(int thr);
extern void func_ov008_021af154(int count, int direction);
extern void func_ov008_021b03b8(int x);
/* The original supplies no argument and consumes the thunk's forwarded return. */
extern int func_ov008_021b23ac();
#define S data_ov008_021b2de4
#define C data_ov008_021b2780
#define I data_ov008_021b2c80
#define SUM (S.top + S.pos)
void func_ov008_021b04c0(void) {
 int x,y;
 func_02006110(&x,&y);
 if (S.count > 3) {
  if (func_ov008_021aa578(0xdc,0x19,0xf4,0x2e)) {
   C.flags |= 0x40;
   if (I.repeat == 0) {
    if (S.top != 0) {
     int bit,row,word;
     S.top--;
     func_ov008_021af154(1,0);
     bit = func_ov008_021aee54(SUM);
     row = func_ov008_021aedfc(SUM);
     word = func_ov008_021aee54(SUM);
     if (!(data_ov008_021b27bc[row][word / 32] & (1 << (bit % 32)))) S.choice = 0;
     I.repeat = 8;
    }
   } else I.repeat--;
  }
  if (func_ov008_021aa578(0xc,0xc,0xd4,0x14)) {
   if (I.repeat == 0) {
    if (S.top != 0) {
     int bit,row,word;
     S.top--;
     func_ov008_021af154(1,0);
     bit = func_ov008_021aee54(SUM);
     row = func_ov008_021aedfc(SUM);
     word = func_ov008_021aee54(SUM);
     if (!(data_ov008_021b27bc[row][word / 32] & (1 << (bit % 32)))) S.choice = 0;
     I.repeat = 8;
    }
   } else I.repeat--;
  }
  if (func_ov008_021aa578(0xdc,0x85,0xf4,0x9a)) {
   C.flags |= 0x80;
   if (I.repeat == 0) {
    if (S.top < S.count - 3) {
     int bit,row,word;
     S.top++;
     func_ov008_021af154(1,1);
     bit = func_ov008_021aee54(SUM);
     row = func_ov008_021aedfc(SUM);
     word = func_ov008_021aee54(SUM);
     if (!(data_ov008_021b27bc[row][word / 32] & (1 << (bit % 32)))) S.choice = 0;
     I.repeat = 8;
    }
   } else I.repeat--;
  }
  if (func_ov008_021aa578(0xc,0x9c,0xd4,0xa4)) {
   if (I.repeat == 0) {
    if (S.top < S.count - 3) {
     int bit,row,word;
     S.top++;
     func_ov008_021af154(1,1);
     bit = func_ov008_021aee54(SUM);
     row = func_ov008_021aedfc(SUM);
     word = func_ov008_021aee54(SUM);
     if (!(data_ov008_021b27bc[row][word / 32] & (1 << (bit % 32)))) S.choice = 0;
     I.repeat = 8;
    }
   } else I.repeat--;
  }
  if (func_ov008_021aa578(0xdc,0x2e,0xf4,0x85)) {
   func_ov008_021b03b8(y);
   C.flags |= 0x100;
  }
 }
 if (S.complete) {
  if (func_ov008_021aa578(0xe3,0xa4,0xfd,0xbe)) {
   if (func_02006164()) C.cancel = 1;
   C.flags |= 1;
  } else C.cancel = 0;
 } else if (S.active == 0) {
  if (func_ov008_021aa578(0x56,0xa4,0xaa,0xbf)) {
   if (func_02006164()) S.autoOpen = 1;
   C.flags |= 0x200;
  } else S.autoOpen = 0;
 }
 if (func_ov008_021b23ac()) {
  if (func_ov008_021aa578(0xe3,0,0x100,0x14)) {
   if (func_02006164()) S.detail = 1;
   C.flags |= 0x400;
  }
 }
}
