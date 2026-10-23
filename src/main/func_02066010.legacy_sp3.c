typedef struct { unsigned char b[0x800]; int len; } Buffer;
typedef struct {
 int sock; char text[0x80]; unsigned char id[0x24];
 int f_a8; int f_ac; int f_b0; int f_b4; char pad_b8[8];
 int f_c0; int f_c4; int f_c8; char addr[8]; char pad_d4[0x30];
 int f_104; unsigned short f_108;
} Conn;
extern int data_0219eb6c;
typedef struct { int addr; } InAddr;
extern InAddr data_0219eb70[];
extern char data_021016f4[], data_02101700[], data_0210170c[], data_02101714[], data_02101718[], data_0210171c[], data_0210172c[], data_02101738[], data_02101744[];
extern void func_02066ea0(Buffer *, unsigned char, const unsigned char *);
extern void func_02067294(Buffer *, char *);
extern void func_020672f4(Buffer *, int);
extern void func_02066a88(int, int, int, unsigned char *, int, unsigned char *, int, unsigned char *);
extern int func_02054ca8(int, void *, int, int, void *, int);
extern int func_02055330(void);
extern int func_020a978c(char *, const char *, ...);
/* This call supplies only r0 although the definition saves four argument words. */
extern void *func_0206e778();
void func_02066010(Conn *c, int mode) {
 Buffer b;
 char tmp[20];
 int i;
 b.len = 0;
 func_02066ea0(&b, 3, c->id);
 for (i=0; i<data_0219eb6c; i++) {
  func_020a978c(tmp, data_021016f4, i);
  func_02067294(&b, tmp);
  func_02067294(&b, func_0206e778(data_0219eb70[i]));
 }
 func_02067294(&b, data_02101700);
 func_020672f4(&b, c->f_c0);
 func_02067294(&b, data_0210170c);
 func_02067294(&b, c->f_c8 ? data_02101714 : data_02101718);
 if (mode != 0) {
  func_02067294(&b, data_0210171c);
  func_020672f4(&b, mode);
 }
 func_02067294(&b, data_0210172c);
 func_02067294(&b, c->text);
 if(c->f_a8 != 0) {
  func_02067294(&b, data_02101738);
  func_020672f4(&b, c->f_104);
  func_02067294(&b, data_02101744);
  func_020672f4(&b, c->f_108);
 }
 if(mode != 2) {
  func_02066a88((int)c, (int)(unsigned long)&b, 255, 0, 255, 0, 255, 0);
 } else {
  if(0x800-b.len >= 1) b.b[b.len++] = 0;
 }
 func_02054ca8(c->sock, &b, b.len, 0, c->addr, 8);
 c->f_ac = func_02055330();
 c->f_b0 = c->f_ac;
 if(mode != 0) c->f_b4 = 0;
}








