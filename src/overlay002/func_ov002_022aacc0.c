typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct {
 void *task; int f4; int src; int dst;
 short size; unsigned short f12; unsigned short flags; unsigned short f16;
 unsigned int mode; char tail[0xc];
} Desc;
extern void *func_02006c0c(void *, int, int);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Desc *);
extern void Task_Invoke(void *p);
extern char data_ov002_022cc418[], data_ov002_022cc434[], data_ov002_022cc44c[], data_ov002_022cc464[], data_ov002_022cc47c[];
void func_ov002_022aacc0(void) {
 Desc a,b,c,d,e;
 void *task;
 *(volatile unsigned int *)0x04001010 = 0;
 *(volatile unsigned short *)0x04001008 = (*(volatile unsigned short *)0x04001008 & ~3) | 3;
 *(volatile unsigned short *)0x04001008 = (*(volatile unsigned short *)0x04001008 & 0x43) | 0x1c80;
 task=func_02006c0c(data_ov002_022cc418,4,0);
 func_0201d47c((Obj *)&a);
 a.task=task;
 a.src=-1;
 a.dst=-1;
 a.flags=(a.flags & ~15)|5;
  a.flags |= 0x10;
 a.mode &= ~0x1c000;
 a.size=0;
 func_0201e5b8(&a);
 Task_Invoke(task);
 task=func_02006c0c(data_ov002_022cc434,4,0);
 func_0201d47c((Obj *)&b);
 b.flags=(b.flags & ~15)|5;
 b.task=task;
 b.src=-1;
 b.dst=0x2440;
 b.flags |= 0x10;
 b.mode &= ~0x1c000;
 b.size=0x200;
 func_0201e5b8(&b);
 Task_Invoke(task);
 task=func_02006c0c(data_ov002_022cc44c,4,0);
 func_0201d47c((Obj *)&c);
 c.task=task;
 c.src=-1;
 c.dst=-1;
 c.flags=(c.flags & ~15)|5;
 c.flags |= 0x10;
 c.mode &= ~0x1c000;
 c.size=0x400;
 func_0201e5b8(&c);
 Task_Invoke(task);
 task=func_02006c0c(data_ov002_022cc464,4,0);
 func_0201d47c((Obj *)&d);
 d.flags=(d.flags & ~15)|5;
 d.src=-1;
 d.dst=-1;
 d.flags |= 0x10;
 d.mode &= ~0x1c000;
 d.size=0x600;
 d.task=task;
 func_0201e5b8(&d);
 Task_Invoke(task);
 task=func_02006c0c(data_ov002_022cc47c,4,0);
 func_0201d47c((Obj *)&e);
 e.flags=(e.flags & ~15)|5;
 e.task=task;
 e.src=-1;
 e.dst=0x2240;
 e.flags |= 0x10;
 e.mode &= ~0x1c000;
 e.size=0x800;
 func_0201e5b8(&e);
 Task_Invoke(task);
}








