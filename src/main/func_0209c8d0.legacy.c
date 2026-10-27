typedef unsigned int u32;
typedef struct { int *buffer; int command; char pad[0x10c]; volatile u32 flags; } Context;
typedef struct { char pad[0x64]; unsigned int flag; } ctx_020919d8_t;
typedef struct Container { void *head; void *f04; } Container;
typedef struct {
 int *head; char pad[0x18]; char *src; char *dst; unsigned int size; int f28; int command; int count; int mode; void (*callback)(void *); void *arg; char pad40[0xcc]; Container queue; volatile unsigned int flags; char pad118[8]; char buffer[256];
} Core;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02000b60(int);
extern void func_020919d8(ctx_020919d8_t *);
extern void func_02091a0c(Container *);
extern void func_020928cc(void *, u32);
extern void func_02092904(void *, u32);
extern void DC_WaitWriteBufferEmpty(void);
extern void func_02094688(const void *, void *, int);
extern int func_0209c7c8(void);
extern int func_0209d288(Context *, int, int);
void func_0209c8d0(Core *p) {
 int command = p->command;
 int mode = p->mode;
 int count = p->count;
 unsigned int limit = 0x100;
 unsigned int n;
 int irq;
 void (*cb)(void *);
 void *arg;
 func_02000b60(0x02000c1c);
 if (command == 11) limit = func_0209c7c8();
 do {
  n = p->size;
  if (limit < n) n = limit;
  p->head[5] = n;
  if (p->flags & 0x40) {
   p->flags &= ~0x40;
   p->head[0] = 7;
   break;
  }
  switch (mode) {
  case 0:
   func_020928cc(p->buffer, n);
   p->head[3] = (int)p->src;
   p->head[4] = (int)p->buffer;
   break;
  case 1: case 2:
   func_02094688(p->src, p->buffer, n);
   func_02092904(p->buffer, n);
   DC_WaitWriteBufferEmpty();
   p->head[3] = (int)p->buffer;
   p->head[4] = (int)p->dst;
   break;
  case 3:
   p->head[3] = (int)p->src;
   p->head[4] = (int)p->dst;
   break;
  }
  if (!func_0209d288((Context *)p, command, count)) break;
  if (mode == 2) {
   if (!func_0209d288((Context *)p, 9, 1)) break;
  } else if (mode == 0) {
   func_02094688(p->buffer, p->dst, n);
  }
  p->src += n;
  p->dst += n;
  p->size -= n;
 } while (p->size != 0);
 {
 void (*cb)(void *) = p->callback;
 void *arg;
 int irq;
 arg = p->arg;
 irq = OS_DisableIrq();
 p->flags &= ~0x4c;
 func_02091a0c(&p->queue);
 if (p->flags & 0x10) func_020919d8((ctx_020919d8_t *)((char *)p + 0x44));
 OS_RestoreIrq(irq);
 if (cb) cb(arg);
 }
}


