typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Context { u32 f0, f4; u32 f8; char pad[0x4c]; u8 state; } Context;
typedef struct Ctx_0203c650 Ctx_0203c650;
typedef struct Obj {
 Context *ctx; void *handle; char pad8[0x1e]; signed char value;
 char pad27; u8 volume; char pad29[4]; u8 timer, delay, end;
 char pad30[4]; u32 id; int saved; char pad3c[0x2c]; u16 flags;
 char pad6a[2]; u8 slot; char pad6d[3]; u8 state, pending;
} Obj;
typedef Obj state_b70_t;
extern void func_020354a8(state_b70_t *p, u8 b, u8 c);
extern void func_020362b0(void);
extern void func_02036474(int a);
extern void func_0203724c(void);
extern int func_02037dc0(int modeArg, int arg1, int arg2);
extern int func_02038168(int id, int v);
extern int func_0203a194(Context *ctx, int arg, int mode);
extern int func_0203bc28(void **p, int slot, u32 id, int saved);
extern int func_0203bdec(void *p);
/* Original caller supplies an extra mode argument beyond the C definition. */
extern int func_0203c58c(void **p, ...);
extern int func_0203c650(Ctx_0203c650 *ctx);
/* Original caller supplies an extra mode argument beyond the C definition. */
extern int func_02087ed4(int *p, ...);
int func_020354bc(Obj *p) {
 int flags = p->flags;
 int state;
 int mode;
 if (flags & 0x400) return 0;
 if (p->ctx->state != 1) return 1;
 if (flags & 0x18) {
  p->pending = 0;
  if (flags & 0x10) {
   flags &= ~0x10;
   if (flags & 4) {
    if ((p->state & 15) >= 4) p->pending = 1;
   } else { p->state = 1; flags |= 4; }
  } else {
   flags &= ~8;
   if (flags & 4) {
    if ((p->state & 15) < 4) p->pending = 4;
   } else { p->state = 4; flags |= 4; }
  }
  p->flags = flags;
 }
 if (!(flags & 4)) return 0;
 flags = p->flags & ~1;
 state = p->state;
 if (state == 3) flags |= 1;
 p->flags = flags;
 if (!(state & 0x80) && p->pending) {
  state = p->state = p->pending; p->pending = 0;
 }
 mode = (p->id >> 20) & 15;
 switch (state & 15) {
 case 1:
  if (!(state & 0x80)) {
   p->state |= 0x80;
   p->volume = 0;
   func_02037dc0((int)p, p->value, p->delay);
  }
  { int delay = p->delay - 1; p->delay = delay; if (delay + 1 <= 0) func_020354a8(p, 2, 6); }
  break;
 case 2:
  if (!(state & 0x80)) p->state |= 0x80;
  if (mode == 4) {
   p->saved = func_0203c650(p->handle);
   func_0203c58c(&p->handle, 0);
  } else if (!(p->flags & 2) && mode == 1) {
   func_02087ed4((int *)&p->handle, 1);
   func_0203a194(p->ctx, 0, 1);
  }
  p->flags |= 1;
  func_0203724c();
  func_020362b0();
  func_020354a8(p, 3, 4);
  break;
 case 3: return 1;
 case 4:
  if (!(state & 0x80)) {
   if (mode != 4) {
    if (mode != 1 || (p->flags & 2)) {
     func_020354a8(p, 6, 1);
     break;
    }
    if (p->ctx->f8 & 0x80) { p->state |= 0x80; break; }
    if (!func_0203a194(p->ctx, 0, 0)) return 1;
    p->ctx->f0 = 0;
    p->ctx->state = 3;
   } else {
    func_0203c58c(&p->handle, 0);
    p->handle = 0;
    if (!func_0203bc28(&p->handle, p->slot, p->id, p->saved)) return 1;
   }
   p->state |= 0x80;
  } else {
   int ready = 0;
   if (p->ctx->state == 1) ready = 1;
   if (ready & 1) func_020354a8(p, 5, 2);
  }
  break;
 case 5:
  if (!(state & 0x80)) {
   p->state |= 0x80;
   if (mode == 4) {
    if (!func_0203bdec(p->handle)) p->state &= ~0x80;
    else func_020354a8(p, 6, 2);
   } else {
    func_02087ed4((int *)&p->handle, 0);
    p->timer = 4;
    func_02038168((int)p, 0x1000);
   }
  } else {
   if (--p->timer == 0) {
    func_02038168((int)p, 0x100);
    func_020354a8(p, 6, 2);
   }
  }
  break;
 case 6:
  p->flags &= ~0x100;
  func_02036474(p->end);
  p->volume = 0x7f;
  func_02037dc0((int)p, p->value, p->end);
  p->flags &= 0xffffefe0;
  p->state = 0;
  func_0203724c();
  break;
 }
 return 1;
}



