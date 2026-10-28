typedef unsigned int u32;
typedef struct {
 unsigned char pad[8]; unsigned char state; unsigned char pad9[0x1f];
 u32 sent; unsigned short pending; unsigned short pad2e; u32 position; u32 field34;
} Conn;
extern void *(*data_0219eee0)(int);
extern int (*data_0219ef0c)(void *);
/* The original reads each table entry again after writing its high byte. */
extern volatile unsigned short data_02101ec4[];
extern int func_02077b5c(void);
extern void func_020757e0(unsigned char *dst, int len);
extern void func_02094688(void *src, void *dst, int n);
extern void func_02077d08(void *param0, int param1, int param2);
extern int func_020705d4(int a, u32 b, int c, int d, Conn *p);
extern void func_02075d44(char *a0, int a1, int a2);
int func_020751e4(Conn *arg) {
 unsigned char *ctx = *(unsigned char **)((char *)arg + 0xc);
 unsigned char *buf = data_0219eee0(0x98);
 unsigned char *p;
 unsigned int time;
 unsigned int i;
 int len;
 int n;
 if (buf == 0) { ctx[0x455] = 9; return 9; }
 p = buf + 9;
 p[0] = 3;
 p[1] = 0;
 time = func_02077b5c();
 ctx[0x34] = time >> 24; ctx[0x35] = time >> 16;
 ctx[0x36] = time >> 8; ctx[0x37] = time;
 func_020757e0(ctx + 0x38, 0x1c);
 func_02094688(ctx + 0x34, p + 2, 0x20);
 func_02077d08(ctx, *(int *)((char *)arg + 0x1c), *(unsigned short *)((char *)arg + 0x18));
 if (ctx[0x30] == 0) { p[0x22] = 0; p += 0x23; }
 else { p[0x22] = 0x20; func_02094688(ctx + 0x74, p + 0x23, 0x20); p += 0x43; }
 *p++ = 0;
 *p++ = 4;
 for (i = 0; i < 2; i++) {
  *p++ = data_02101ec4[i] >> 8;
  *p++ = data_02101ec4[i];
 }
 *p++ = 1; *p++ = 0;
 len = p - buf - 5;
 n = len - 4;
 buf[0] = 0x16; buf[1] = 3; buf[2] = 0;
 buf[3] = len >> 8; buf[4] = len; buf[5] = 1;
 buf[6] = n >> 16; buf[7] = n >> 8; buf[8] = n;
 func_020705d4((int)buf, len + 5, 0, 0, arg);
 func_02075d44((char *)ctx, (int)(buf + 5), len);
 return data_0219ef0c(buf);
}

