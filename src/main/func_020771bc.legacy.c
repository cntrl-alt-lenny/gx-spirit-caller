typedef unsigned char u8;
typedef unsigned short u16;
typedef struct { u8 pad[0x468]; u8 bytes[0x14]; int len; u8 pad2[0x124]; u8 *p; int n; } Ctx;
typedef struct { int unused; int n; u8 *p; int n2; u8 *p2; } Input;
extern void *(*data_0219eee0)(int);
extern void (*data_0219ef0c)(void *);
extern void func_02078f50(u16 *, u8 *, int, int);
extern void func_0207947c(u16 *, u16 *, u16 *, int, u16 *);
extern void func_02078f08(u8 *, u16 *, int, int);
extern int func_02077aec(void);
extern void func_02077ab4(int);
extern int func_020a7440(unsigned char *, unsigned char *, int);
int func_020771bc(Ctx *ctx, Input *in) {
 int i, id, count, byte;
 u16 *b, *c, *buf; u8 *a;
 if (!ctx->p || !ctx->n || !in->p2 || !in->n2 || !in->p || !in->n) return 2;
 count = (in->n << 1) / 2;
 buf = data_0219eee0(count * 8);
 if (!buf) return 2;
 a = (u8 *)(buf + count); b = (u16 *)a + count; c = b + count;
 func_02078f50((u16 *)a,ctx->p,ctx->n,count);
 func_02078f50(b,in->p2,in->n2,count);
 func_02078f50(c,in->p,in->n,count);
 id = func_02077aec();
 func_0207947c(buf,(u16 *)a,b,count,c);
 func_02077ab4(id);
 func_02078f08(a,buf,in->n,count);
 byte = ((u8 *)buf)[count * 2];
 count = 0;
 if (byte != 0 || (a)[1] != 1) count = 2;
 else {
  i=2; while (i < in->n) { if ((a)[i] != 0xff) break; i++; }
  if (i+1 >= in->n || (a)[i] != 0 || (a)[i+1] != 0x30 || func_020a7440(ctx->bytes,a+in->n-ctx->len,ctx->len)) count=2;
 }
 data_0219ef0c(buf);
 return count;
}










