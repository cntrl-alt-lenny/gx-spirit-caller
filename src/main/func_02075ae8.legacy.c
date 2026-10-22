typedef unsigned char u8;
typedef unsigned int u32;
typedef struct Ctx {
 u8 pad0[0x1d4]; void *f1d4;
 u8 pad1d8[0x10c]; u8 f2e4[8];
 u8 pad2ec[0x168]; u8 f454; u8 state; u8 f456;
 u8 pad457[0x3cd]; u8 *f824; u32 f828; u32 f82c;
} Ctx;
extern void (*data_0219ef0c)(void *);
extern void func_02075d44(char *a0, int a1, int a2);
extern int func_02076008(char *ctx, u8 *packet);
extern int func_02076284(void *param0, void *param1);
extern void func_0207651c(void *self, int b);
extern void func_02076ad0(Ctx *c, unsigned char *p);
extern void func_02076d14(Ctx *c, u8 *p);
extern void func_02076ddc(Ctx *c, u8 *p);
extern void func_020945f4(void *dst, int value, unsigned int size);
void func_02075ae8(Ctx *ctx, u8 *packet) {
 u8 *p;
 u32 type;
 u32 length;
 u32 size;
 if (ctx->state == 9) { data_0219ef0c(packet); return; }
 length = (packet[3] << 8) + packet[4] + 5;
 type = packet[0];
 if (((u8)(ctx->state + 0xf9) <= 1 && type != 21) || (type == 21 && length > 7))
  length = func_02076008((char *)ctx, packet);
 p = packet + 5;
 length -= 5;
 switch (type) {
 case 20:
  if (ctx->f1d4 == 0) ctx->state = 9;
  else { func_020945f4(ctx->f2e4, 0, 8); ctx->state = 7; }
  break;
 case 21:
  if (p[0] == 2) ctx->state = 9;
  break;
 case 22:
  do {
   int subtype = p[0];
   size = (p[1] << 16) + (p[2] << 8) + p[3];
   p += 4;
   switch (subtype) {
   case 1: if (ctx->f454 != 0 && ctx->state == 0) func_02076ad0(ctx, p); break;
   case 16: func_0207651c(ctx, (int)p); break;
   case 2: func_02076d14(ctx, p); break;
   case 11: func_02076ddc(ctx, p); break;
   case 14: ctx->state = 4; break;
   case 20: func_02076284(ctx, p); break;
   default: ctx->state = 9; break;
   }
   func_02075d44((char *)ctx, (int)(p - 4), size + 4);
   p += size;
   length -= size + 4;
  } while (length != 0 && ctx->state != 9);
  break;
 case 23:
  ctx->f824 = packet;
  ctx->f82c = 5;
  ctx->f828 = length + 5;
  ctx->f456 = 1;
  return;
 default: ctx->state = 9; break;
 }
 data_0219ef0c(packet);
}

