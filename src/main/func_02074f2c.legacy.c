typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u8 start[0x455]; u8 state; u8 pad[0x3e]; u8 modulus[0x100]; int size; u8 exponent[8]; int exponent_size; } Context;
typedef struct { u8 pad[0xc]; Context *ctx; } Conn;
extern void *(*data_0219eee0)(int);
extern void (*data_0219ef0c)(void *);
extern void func_020757e0(unsigned char *dst, int len);
extern void func_02094688(const void *src, void *dst, int n);
extern void func_02078f50(unsigned short *out, unsigned char *in, int length, int capacity);
extern int func_02077aec(void);
extern void func_02077ab4(int id);
extern void func_0207947c(u16 *out, u16 *in, u16 *exponent, int count, u16 *modulus);
extern int func_020705d4(int a, u32 b, int c, int d, Conn *p);
extern void func_02075d44(char *a0, int a1, int a2);
void func_02074f2c(Conn *conn) {
 Context *ctx = conn->ctx;
 u16 *work;
 u16 *exp;
 u16 *mod;
 int i;
 u16 *in;
 int count;
 int saved;
 u8 *packet, *dst;
 u8 *input;
 int size;
 ctx->start[0] = 3;
 ctx->start[1] = 0;
 func_020757e0(ctx->start + 2, 0x2e);
 size = ctx->size;
 count = (size * 2) / 2;
 input = data_0219eee0(size);
 if (input == 0) { ctx->state = 9; return; }
 input[0] = 0;
 input[1] = 2;
 func_020757e0(input + 2, size - 0x33);
 input[size - 0x31] = 0;
 func_02094688(ctx, input + size - 0x30, 0x30);
 work = data_0219eee0(count * 8);
 if (work == 0) { data_0219ef0c(input); ctx->state = 9; return; }
 in = work + count;
 exp = in + count;
 mod = exp + count;
 func_02078f50(in, input, size, count);
 func_02078f50(exp, ctx->exponent, ctx->exponent_size, count);
 func_02078f50(mod, ctx->modulus, size, count);
 saved = func_02077aec();
 func_0207947c(work, in, exp, count, mod);
 func_02077ab4(saved);
 packet = data_0219eee0(size + 0x49);
 if (packet == 0) { data_0219ef0c(input); data_0219ef0c(work); ctx->state = 9; return; }
 packet[0] = 0x16;
 packet[1] = 3;
 packet[2] = 0;
 packet[3] = (size + 4) >> 8;
 packet[4] = size + 4;
 packet[5] = 0x10;
 packet[6] = size >> 16;
 packet[7] = size >> 8;
 packet[8] = size;
 dst = packet + 9;
 if (size & 1) { *dst++ = work[size / 2]; }
 for (i = size / 2 - 1; i >= 0; i--) {
  *dst++ = work[i] >> 8;
  *dst++ = work[i];
 }
 func_020705d4((int)packet, size + 9, 0, 0, conn);
 func_02075d44((char *)ctx, (int)(packet + 5), size + 4);
 data_0219ef0c(packet);
 data_0219ef0c(work);
 data_0219ef0c(input);
}


