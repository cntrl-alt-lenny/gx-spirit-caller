typedef struct T_0206b7d8 T_0206b7d8;
extern int func_02055000(int a0);
extern int func_02054d4c(int unused0, int unused1, int unused2, int unused3);
extern void func_02067870(void *obj, unsigned char *buf, int count);
extern int func_02069720(void *obj);
extern int func_02069ec4(T_0206b7d8 *o);
extern void func_0206b258(unsigned char *ctx);
struct Obj {
 int state;
 unsigned char pad4[0x78];
 unsigned char *buf;
 int size;
 unsigned char pad84[0x42c];
 int socket;
 unsigned char pad4b4[0x114];
 int step;
};
int func_02069634(struct Obj *o) {
 int result;
 int n;
 int old;
 if (func_02055000(o->socket) == 0) return 0;
 old = o->size;
 n = func_02054d4c(o->socket, (int)(o->buf + old), 0x1000 - old, 0);
 if ((unsigned int)(n + 1) <= 1) {
  func_0206b258((unsigned char *)o);
  return 3;
 }
 result = 0;
 o->size += n;
 if (o->state == 2 || o->step > 0) {
  func_02067870((unsigned char *)o + 0x4bc, o->buf + old, o->size - old);
 }
 if (o->state == 3) result = func_02069ec4((T_0206b7d8 *)o);
 if (result != 0) return result;
 if (o->state == 2 && o->size > 0) return func_02069720(o);
 return 0;
}

