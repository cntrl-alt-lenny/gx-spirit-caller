typedef unsigned int u32;
typedef struct {
 unsigned char pad[8]; unsigned char state; unsigned char pad9[0x1f];
 u32 sent; unsigned short pending; unsigned short pad2e; u32 position; u32 field34;
} Conn;
typedef struct { int size; unsigned char *data; } Extra;
extern void *(*data_0219eee0)(int);
extern int (*data_0219ef0c)(void *);
extern unsigned int data_021a0704;
extern int func_02077b5c(void);
extern void func_020757e0(unsigned char *dst, int len);
extern void func_02094688(void *src, void *dst, int n);
extern void func_02075d44(char *a0, int a1, int a2);
extern int func_020705d4(int a, u32 b, int c, int d, Conn *p);
int func_020754f4(Conn *arg) {
 unsigned char *ctx = *(unsigned char **)((char *)arg + 12);
 unsigned char *buf;
 unsigned char *p;
 int len;
 Extra *extra = *(Extra **)(ctx + 0x820);
 int size = extra ? extra->size : 0;
 unsigned int time = func_02077b5c();
 ctx[0x54] = time >> 24;
 ctx[0x55] = time >> 16;
 ctx[0x56] = time >> 8;
 ctx[0x57] = time;
 func_020757e0(ctx + 0x58, 0x1c);
 buf = data_0219eee0(size + 0x9d);
 if (!buf) { ctx[0x455] = 9; return 1; }
 p = buf + 5;
 *p++ = 2; *p++ = 0; *p++ = 0; *p++ = 0x46; *p++ = 3; *p++ = 0;
 func_02094688(ctx + 0x54, p, 0x20);
 p += 0x20;
 *p++ = 0x20;
 if (ctx[0x30]) {
  func_02094688(ctx + 0x74, p, 0x20);
  ctx[0x31] = 1;
  p += 0x20;
 } else {
  func_020757e0(p, 0x1c);
  unsigned int counter = data_021a0704;
  p += 0x1c;
  *p++ = counter >> 24;
  *p++ = counter >> 16;
  *p++ = counter >> 8;
  *p++ = counter;
  func_02094688(p - 0x20, ctx + 0x74, 0x20);
  data_021a0704++;
  ctx[0x31] = 0;
 }
 *p++ = *(unsigned short *)(ctx + 0x32) >> 8;
 *p++ = *(unsigned short *)(ctx + 0x32);
 *p++ = 0;
 if (!ctx[0x31]) {
  if (size) {
   int n;
   *p++ = 11;
   n = size + 6;
   *p++ = n >> 16; *p++ = n >> 8; *p++ = n;
   n = size + 3;
   *p++ = n >> 16; *p++ = n >> 8; *p++ = n;
   *p++ = size >> 16; *p++ = size >> 8; *p++ = size;
   func_02094688(extra->data, p, size);
   p += size;
  }
  *p++ = 14; *p++ = 0; *p++ = 0; *p++ = 0;
 }
 len = p - buf - 5;
 buf[0] = 0x16; buf[1] = 3; buf[2] = 0; buf[3] = len >> 8; buf[4] = len;
 func_02075d44((char *)ctx, (int)(buf + 5), len);
 func_020705d4((int)buf, len + 5, 0, 0, arg);
 data_0219ef0c(buf);
 return ctx[0x31];
}






