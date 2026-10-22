#include "runtime/intrinsics.h"
typedef struct { int count; } Self0205407c;
typedef struct obj_0206a984_t obj_0206a984_t;
typedef struct T_0206b7d8 T_0206b7d8;
struct T_0206b7d8 {
 int state; int f4; Self0205407c *table; char padc[0x70];
 unsigned char *buf; int size; int values[255];
 int count; int expected;
 void (*callback)(void *, int, int, int); char pad48c[8]; int arg;
 char pad498[8]; unsigned int header; int f4a4; unsigned short kind;
 char pad4aa[0x11a]; int flags; int step;
};
extern void func_0205407c(Self0205407c *self, void *val);
extern int func_02054140(void *p);
extern void *func_020541b8(int elemSize, int count, int extra);
extern void func_02067870(void *obj, unsigned char *buf, int count);
extern void func_0206a314(void *p, int value);
extern int func_0206a31c(T_0206b7d8 *ctx, unsigned char *s, int n);
extern void func_0206a984(obj_0206a984_t *o, signed char *in, int len);
extern int func_0206b44c(signed char *s, int n);
extern int func_0206b4fc(void *a0, int a1);
extern void func_020a6d54(int a,int b,int c,int d);
extern signed char *func_020a7388(signed char *dst, signed char *src, int n);
extern int data_0219eccc;
extern char data_02101dc0[], data_02101db0[];
int func_02069ec4(T_0206b7d8 *o) {
 unsigned char *p = o->buf;
 int len = o->size;
 int n, k, keylen;
 struct { int key, len; } kv;
 switch (o->step) {
 case 0:
  if (len < 1) break;
  n = (p[0] ^ 0xec) + 2;
  if (len < n) break;
  keylen = p[n-1] ^ 0xea;
  k = n + keylen;
  if (len < k) break;
  func_0206a984((obj_0206a984_t *)o, (signed char *)(p+n), keylen);
  p += k; len -= k;
  o->step = 1;
  func_02067870((char *)o+0x4bc, p, len);
 case 1:
  if (len < 6) break;
  __memcpy(&o->header,p,4);
  o->callback(o,6,data_0219eccc,o->arg);
  __memcpy(&o->kind,p+4,2);
  if (o->kind == 0xffff) {
   if (func_0206b44c((signed char *)(p+6),len-6) == -1) break;
   func_0206a314(o,(int)(p+6));
   o->callback(o,5,data_0219eccc,o->arg);
   if (o->buf == 0) break;
  }
  p += 6; len -= 6;
  if ((o->flags & 2) || o->kind == 0xffff) {
   o->step = 5; o->state = 2; break;
  }
  o->step = 2; o->expected = -1;
 case 2:
  if (o->expected == -1) {
   if (len < 1) break;
   o->expected = *p;
   o->table = func_020541b8(8,o->expected,0);
   if (o->table == 0) return 5;
   p++; len--;
  }
  while (o->expected > func_02054140(o->table)) {
   if (len < 2) break;
   n = func_0206b44c((signed char *)(p+1),len-1);
   if (n == -1) break;
   kv.len = *p;
   kv.key = func_0206b4fc(o,(int)(p+1));
   func_0205407c(o->table,&kv);
   p += n+1; len -= n+1;
  }
  if (o->expected > func_02054140(o->table)) break;
  o->step = 3; o->expected = -1;
 case 3:
  if (o->expected == -1) {
   if (len < 1) break;
   o->expected = *p;
   p++;
   o->count = 0;
   len--;
  }
  while (o->expected > o->count) {
   n = func_0206b44c((signed char *)p,len);
   if (n == -1) break;
   o->values[o->count++] = func_0206b4fc(o,(int)p);
   p += n; len -= n;
  }
  if (o->expected > o->count) break;
  o->step = 4;
 case 4:
  if (len < 5) break;
  do {
   n = func_0206a31c(o,p,len);
   if (n == -2) return 5;
   if (n == -1) {
    o->step = 5; o->state = 2;
    len -= 5; p += 5;
    o->callback(o,3,data_0219eccc,o->arg);
    break;
   }
   p += n; len -= n;
   if (o->buf == 0) n = 0;
  } while (n != 0);
 }
 if (len < 0) func_020a6d54((int)data_02101dc0,(int)data_02101db0,0,0x4af);
 if (o->buf == 0) return 0;
 if (len != 0) func_020a7388((signed char *)o->buf,(signed char *)p,len);
 o->size = len;
 return 0;
}

