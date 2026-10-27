typedef unsigned int u32;
typedef struct Node Node;
typedef struct Node_0200fb18 Node_0200fb18;
typedef struct Node_0200fd1c Node_0200fd1c;
typedef struct { signed char type; char pad[7]; int f8; } Query_0200fb18;
typedef struct { int f0, f4, f8; } Query_0200fd1c;
typedef struct { signed char type; char pad[11]; u32 size; } Query;
typedef struct { char pad[0x18]; u32 addr; char pad2[4]; } Item;
typedef struct Context {
 char pad[0x18]; Item *items; Query_0200fd1c *others; char pad2[0x40];
 u32 unused:1; u32 active:1; u32 mid:23; u32 refs:5; u32 upper:2;
 char pad3[0x18];
 u32 low:26; u32 cached:1; u32 cached2:1; u32 high:4;
 char pad4[0x1dc]; u32 addr; int index; u32 addr2; int index2;
} Context;
typedef struct {
 void *item; int kind; Context *ctx;
 u32 skip:1; u32 offset:22; u32 middle:6; u32 clear:1; u32 mode:1; u32 alloc:1;
 const void *source; u32 size;
} Entry;
typedef struct { char pad[0x40]; unsigned short head, tail, count; } Queue;
typedef struct { char pad[0x1940]; union { Entry entries[256]; struct { char pad[0x17c0]; Queue q; } ring; } u; } Globals;
extern Globals data_0218cbc8;
extern Queue data_0218fcc8;
extern Node_0200fb18 *func_0200fb18(Query_0200fb18 *q);
extern Node_0200fd1c *func_0200fd1c(Query_0200fd1c *q);
extern int func_0200fdfc(void *arg, Node *node, int kind, int locked, int skip);
extern u32 func_020101b4(Query *q);
extern u32 func_02010354(Query_0200fd1c *q);
extern void func_02010eb4(void);
extern void func_02092904(const void *source, u32 size);
extern void func_02090330(void);
extern void func_020901cc(const void *source, u32 offset, u32 size);
extern void func_0209015c(void);
extern void func_02090114(void);
extern void func_020900a0(const void *source, unsigned int offset, unsigned int size);
extern void func_02090048(void);
int func_02010b08(void) {
 Globals *g = &data_0218cbc8;
 Entry *e;
 if (data_0218fcc8.count == 0) return 0;
 if (g->u.ring.q.tail == g->u.ring.q.head) return 0;
 e = &g->u.entries[g->u.ring.q.head];
 if (e->ctx != 0) {
  switch (e->kind) {
  case 0: {
   Item *item = e->item;
   if (!e->skip) {
    Node_0200fb18 *n = func_0200fb18((Query_0200fb18 *)item);
    if (n != 0) {
     if (e->alloc) {
      if (!func_0200fdfc(item, (Node *)n, 0, 0, 0)) return 0;
     }
     break;
    } else {
     u32 addr;
     Context *ctx = e->ctx;
     if (ctx->cached && ctx->index == item - ctx->items) {
      addr = ctx->addr;
      if (e->clear) ctx->cached = 0;
     } else addr = func_020101b4((Query *)item);
     if (addr == 0x80000) { func_02010eb4(); for (;;) {} }
     item->addr = addr;
     if (e->alloc) {
      if (!func_0200fdfc(item, 0, 0, 0, 0)) return 0;
     }
    }
   }
   func_02092904(e->source, e->size);
   func_02090330();
   if (e->mode) {
    if (item->addr < 0x20000) func_020901cc(e->source, (item->addr >> 1) + 0x20000, e->size);
    else func_020901cc(e->source, ((item->addr - 0x40000) >> 1) + 0x30000, e->size);
   } else func_020901cc(e->source, item->addr + e->offset, e->size);
   func_0209015c();
   break;
  }
  case 1: {
   Query_0200fd1c *item = e->item;
   if (!e->skip) {
    Node_0200fd1c *n = func_0200fd1c(item);
    if (n != 0) {
     if (e->alloc) {
      if (!func_0200fdfc(item, (Node *)n, 1, 0, 0)) return 0;
     }
     break;
    } else {
     u32 addr;
     Context *ctx = e->ctx;
     if (ctx->cached2 && ctx->index2 == item - ctx->others) {
      addr = ctx->addr2;
      if (e->clear) ctx->cached2 = 0;
     } else addr = func_02010354(item);
     if (addr == 0x80000) { func_02010eb4(); for (;;) {} }
     item->f8 = addr;
     if (e->alloc) {
      if (!func_0200fdfc(item, 0, 1, 0, 0)) return 0;
     }
    }
   }
   func_02092904(e->source, e->size);
   func_02090114();
   func_020900a0(e->source, item->f8 + e->offset, e->size);
   func_02090048();
   break;
  }
  default: return 0;
  }
 }
 g->u.ring.q.count--;
 if (e->ctx != 0) {
  e->ctx->refs--;
  if (e->ctx->refs == 0) e->ctx->active = 0;
 }
 g->u.ring.q.head++;
 if (g->u.ring.q.head >= 0x100) g->u.ring.q.head = 0;
 return 1;
}
