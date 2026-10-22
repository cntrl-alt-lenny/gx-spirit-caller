typedef unsigned char u8;
typedef unsigned short u16;
typedef struct Result { int flags; int pad[9]; int matrix[9]; int xyz[3]; } Result;
typedef struct Context Context;
typedef struct Config { char p0[0x10]; void *arg; int (*load)(Result *,void *,int); char p18[0x1c]; Result *results; } Config;
struct Context {
 u8 *stream; Config *config; volatile unsigned flags; char p0c[0x18];
 void (*hook)(Context *); char p28[0x6a]; u8 stage; char p93[0x1b]; u8 id; char paf[5]; Result *result;
 char pb8[0x1c]; u8 *data; char pd8[0x10];
 void (*decode)(Result *,void *,u8 *,unsigned); void (*draw)(Result *); char pf0[0x3c]; Result local;
};
extern void func_02084e0c(int cmd, void *src, int n);
extern void func_020947b8(void *dst);
extern u8 data_020bef5c[][4];
void func_02083dd8(Context *ctx, int mode) {
 int id = ctx->stream[1];
 int length = 4;
 int stage, skip; unsigned flags;
 Result *res;
 short *values; u8 *record;
 int axis;
 int a,b;
 ctx->id = id;
 ctx->flags |= 0x10;
 flags = ctx->flags;
 if (flags & 0x400) {
  if (mode == 0x40 || mode == 0x60) length++;
  if (mode == 0x20 || mode == 0x60) {
   length++;
   if (!(flags & 0x100)) { int cmd = ctx->stream[4]; func_02084e0c(0x14,&cmd,1); }
  }
  ctx->stream += length;
  return;
 }
 if (mode == 0x40 || mode == 0x60) {
  int cmd;
  length++;
  if (mode == 0x40) cmd = ctx->stream[4]; else cmd = ctx->stream[5];
  if (!(ctx->flags & 0x100)) func_02084e0c(0x14,&cmd,1);
 }
 ctx->result = &ctx->local;
 stage = ctx->hook ? ctx->stage : 0;
 if (stage == 1) {
  ctx->flags &= ~0x40;
  ctx->hook(ctx);
  stage = ctx->hook ? ctx->stage : 0;
  skip = ctx->flags & 0x40;
 } else skip = 0;
 if (!skip) {
  if (ctx->config->results) { res = &ctx->config->results[id]; skip = !(ctx->flags & 0x80); }
  else { res = &ctx->local; skip = 0; }
  if (!skip) {
   res->flags = 0;
   if (!ctx->config->arg || !ctx->config->load(res,ctx->config->arg,id)) {
    u8 *base = ctx->data;
    u8 *table = base + *(u16 *)(base+6);
    int stride = *(u16 *)table;
    u8 *entry = stride * id + table;
    record = base + *(unsigned *)(entry+4);
    values = (short *)(record+4);
    if (*(u16 *)record & 1) res->flags |= 4;
    else {
     res->xyz[0] = ((int *)values)[0]; res->xyz[1] = ((int *)values)[1]; res->xyz[2] = ((int *)values)[2];
     values += 6;
    }
    if (*(u16 *)record & 2) res->flags |= 2;
    else if (*(u16 *)record & 8) {
     axis = (*(u16 *)record & 0xf0) >> 4;
     a = values[0]; b = values[1];
     func_020947b8(res->matrix);
     res->matrix[axis] = (*(u16 *)record & 0x100) ? -0x1000 : 0x1000;
     values += 2;
     res->matrix[data_020bef5c[axis][0]] = a;
     res->matrix[data_020bef5c[axis][1]] = b;
     if (*(u16 *)record & 0x200) b = -b;
     res->matrix[data_020bef5c[axis][2]] = b;
     if (*(u16 *)record & 0x400) a = -a;
     res->matrix[data_020bef5c[axis][3]] = a;
    } else {
     res->matrix[0] = *(short *)(record+2);
     res->matrix[1] = values[0]; res->matrix[2] = values[1]; res->matrix[3] = values[2]; res->matrix[4] = values[3];
     res->matrix[5] = values[4]; res->matrix[6] = values[5]; res->matrix[7] = values[6]; res->matrix[8] = values[7];
     values += 8;
    }
    ctx->decode(res,values,ctx->stream,*(u16 *)record);
   }
  }
  ctx->result = res;
 }
 if (stage == 2) {
  ctx->flags &= ~0x40; ctx->hook(ctx);
  stage = ctx->hook ? ctx->stage : 0;
  skip = ctx->flags & 0x40;
 } else skip = 0;
 if (!skip && !(ctx->flags & 0x100)) ctx->draw(ctx->result);
 ctx->result = 0;
 if (stage == 3) { ctx->flags &= ~0x40; ctx->hook(ctx); skip = ctx->flags & 0x40; } else skip = 0;
 if (mode == 0x20 || mode == 0x60) {
  length++;
  if (!skip && !(ctx->flags & 0x100)) { int cmd = ctx->stream[4]; func_02084e0c(0x13,&cmd,1); }
 }
 ctx->stream += length;
}








