typedef struct Owner Owner;
typedef struct { char pad[4]; int field_4; } Obj;
typedef struct { int id; } Request2;
typedef struct { int key; int f4; int source; } Request;
typedef struct {
 int f0;
 char pad4[0x18];
 Owner *owner;
 int f20;
 unsigned int state;
 char pad28[0x78];
 int a0;
 char pada4[0x2c0];
 void *cleanup;
 char f368;
 volatile unsigned char mode;
 char pad36a[2];
 unsigned char pending;
} State;
extern State *data_0219daec;
extern int func_02045280(void);
extern int func_0204550c(void);
extern void func_02046094(int, Request *);
extern void func_020461fc(int, Obj *);
extern int func_0204653c(int);
extern void func_020466f4(int);
extern void func_02046714(void);
extern void func_020480b4(int, int);
extern void func_02048124(void);
extern void func_0204823c(void);
extern void func_020491ec(int, Request *);
extern void func_020492d0(int, Request2 *);
extern void func_02049430(void);
extern void func_020507b4(int);
extern void func_02052424(void);
extern int func_02053774(void);
extern int func_02055f84(Owner **, int, void *, int);
extern int func_02056068(Owner **out, int a, int b);
extern void func_02067354(void *);
void func_0204717c(void) {
 if (func_0204550c() != 0) func_02046714();
 if (data_0219daec == 0) return;
 if (data_0219daec->state == 0) return;
 if (func_02045280() != 0) return;
 switch (data_0219daec->state) {
 case 1:
  switch (func_02053774()) {
  case 1:
   if (func_0204653c(func_02056068(&data_0219daec->owner, data_0219daec->a0, 0)) != 0) return;
   if (func_0204653c(func_02055f84(&data_0219daec->owner, 0, func_020461fc, 0)) != 0) return;
   if (func_0204653c(func_02055f84(&data_0219daec->owner, 3, func_02046094, 0)) != 0) return;
   if (func_0204653c(func_02055f84(&data_0219daec->owner, 1, func_020492d0, 0)) != 0) return;
   if (func_0204653c(func_02055f84(&data_0219daec->owner, 2, func_020491ec, 0)) != 0) return;
   func_020466f4(2);
   func_0204823c();
   break;
  case 2: func_020480b4(3, -20110); return;
  case 3: func_020480b4(4, -20101); return;
  }
  break;
 case 2: func_02048124(); break;
 case 3:
 case 4: func_02049430(); func_020507b4(0); break;
 case 5: func_020507b4(1); func_02049430(); break;
 case 6:
  func_02052424();
  func_02049430();
  if (data_0219daec->mode == 2 || data_0219daec->mode == 3) func_020507b4(1);
  else if (data_0219daec->f0 != 0) func_020507b4(0);
  break;
 }
 if (data_0219daec->pending != 1) return;
 if (data_0219daec->cleanup != 0) {
  func_02067354(data_0219daec->cleanup);
  data_0219daec->cleanup = 0;
 }
 data_0219daec->pending = 0;
}

