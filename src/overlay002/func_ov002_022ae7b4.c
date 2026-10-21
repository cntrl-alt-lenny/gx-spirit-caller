typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct { void *task; int f4, f8, fc; short f10; unsigned short f12, flags, f16; int f18; char tail[12]; } Desc;
typedef struct { int f0, a[3], pad[3], b[3], f28, f2c; } Self;
extern char data_ov002_022cc77c[], data_ov002_022cc794[], data_ov002_022cc764[];
extern void *data_ov002_022ca4d0[], *data_ov002_022ca4c8[];
extern int data_020b4728[];
extern void *func_02006c0c(void *, int, int);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Desc *o);
extern void Task_Invoke(void *p);
extern int OS_SPrintf(char *, const char *, ...);
extern void func_02094550(int *src, int *dst, unsigned int count);
void func_ov002_022ae7b4(Self *self) {
 int i;
 void *task;
 Desc a;
 Desc b;
 char name[32];
 Desc c;
 Desc d;
 unsigned int j;
 int dest;
 self->f2c = -1;
 for (i=0; i<3; i++) { self->a[i]=self->b[i]=-1; }
 task=func_02006c0c(data_ov002_022cc77c,4,0);
 func_0201d47c((Obj *)&a);
 a.task=task;
 a.flags=(a.flags & ~0xf)|9;
 a.fc=0x5880;
 a.f10=0x20;
 func_0201e5b8(&a);
 Task_Invoke(task);
 task=func_02006c0c(data_ov002_022cc794,4,0);
 func_0201d47c((Obj *)&b);
 b.task=task;
 b.flags=(b.flags & ~0xf)|9;
 b.fc=0x3b00;
 b.f10=0xc0;
 func_0201e5b8(&b);
 Task_Invoke(task);
 dest=0x5f80;
 for(j=0;j<5;j++) {
  OS_SPrintf(name,data_ov002_022cc764,data_ov002_022ca4d0[j]);
  task=func_02006c0c(name,4,0);
  func_0201d47c((Obj *)&c);
  c.task=task;
  c.flags=(c.flags & ~0xf)|9;
  c.fc=dest;
  c.f10=-1;
  func_0201e5b8(&c);
  Task_Invoke(task);
  dest+=0x800;
 }
 func_02094550(data_020b4728,(int *)0x050006e0,0x20);
 for(j=0;j<2;j++) {
  task=func_02006c0c(data_ov002_022ca4c8[j],4,0);
  func_0201d47c((Obj *)&d);
  d.flags=(d.flags & ~0xf)|9;
  d.task=task;
  d.fc=-1;
  d.flags|=0x10;
  d.f10=(j+2)<<9;
  func_0201e5b8(&d);
  Task_Invoke(task);
 }
}



