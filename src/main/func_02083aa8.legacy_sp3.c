typedef unsigned char u8;
typedef unsigned int u32;
typedef struct { u8 pad[0xfc]; u32 f_fc; } state_021a18b8_t;
struct M44 { int m[16]; };
struct Mtx43;
struct Mtx44;
struct Context { u8 *pc; int pad4; u32 flags; u8 padc[0x1c]; void (*callback)(struct Context *); u8 pad2c[0x67]; u8 stage; };
extern state_021a18b8_t data_021a18b8;
extern int data_021a1904;
extern int data_02102280[3], data_0210228c[3];
extern int data_02102250[], data_02102254[], data_0210225c[];
extern state_021a18b8_t *func_020820b8(void);
extern state_021a18b8_t *func_020820f8(void);
extern int *func_02082198(void);
extern void func_02084e0c(int cmd, void *src, int n);
extern void func_02084fe0(void);
extern void MTX_Copy43To44_(struct Mtx43 *src, struct Mtx44 *dst);
extern void func_0208b980(struct M44 *a, struct M44 *b, struct M44 *out);
extern int func_0208c2e0(int *v);
extern int func_0208e664(int *out);
/* The assembly definition has no formal parameters; the routine consumes r0-r2. */
extern void func_020944ec(void *src, void *dst, int size);
void func_02083aa8(struct Context *ctx, int mode)
{
    int n = 2;
    int *pos = data_02102280;
    int *scale = data_0210228c;
    int stage, handled;
    int arg0, arg1;
    struct M44 matrix, temp0, temp1;
    if (ctx->flags & 0x200) {
        if (mode == 0x40 || mode == 0x60) n++;
        if (mode == 0x20 || mode == 0x60) n++;
        ctx->pc += n;
        return;
    }
    if (mode == 0x40 || mode == 0x60) {
        n++;
        if (!(ctx->flags & 0x100)) {
            if (mode == 0x40) arg0 = ctx->pc[2];
            else arg0 = ctx->pc[3];
            func_02084e0c(0x14, &arg0, 1);
        }
    }
    stage = ctx->callback ? ctx->stage : 0;
    if (stage == 1) {
        ctx->flags &= ~0x40;
        ctx->callback(ctx);
        stage = ctx->callback ? ctx->stage : 0;
        handled = ctx->flags & 0x40;
    } else handled = 0;
    if (!(ctx->flags & 0x100) && !handled) {
        func_02084fe0();
        *(volatile u32 *)0x04000400 = 0x151110;
        *(volatile u32 *)0x04000400 = 0;
        *(volatile u32 *)0x04000400 = 0;
        while (func_0208e664(matrix.m) != 0) {}
        if (data_021a18b8.f_fc & 1) {
            MTX_Copy43To44_((struct Mtx43 *)func_020820f8(), (struct Mtx44 *)&temp0);
            func_0208b980(&matrix, &temp0, &matrix);
        } else if (data_021a18b8.f_fc & 2) {
            MTX_Copy43To44_((struct Mtx43 *)&data_021a1904, (struct Mtx44 *)&temp1);
            func_0208b980(&matrix, &temp1, &matrix);
        }
        pos[0] = matrix.m[12];
        pos[1] = matrix.m[13];
        pos[2] = matrix.m[14];
        scale[0] = func_0208c2e0(matrix.m);
        scale[1] = func_0208c2e0(&matrix.m[4]);
        scale[2] = func_0208c2e0(&matrix.m[8]);
        if (data_021a18b8.f_fc & 1) {
            *(volatile u32 *)0x04000400 = 0x171012;
            func_020944ec(data_02102254, (void *)0x04000400, 8);
            func_020944ec(func_020820b8(), (void *)0x04000400, 0x30);
            *(volatile u32 *)0x04000400 = 0x1b19;
            func_020944ec(data_0210225c, (void *)0x04000400, 0x3c);
        } else if (data_021a18b8.f_fc & 2) {
            *(volatile u32 *)0x04000400 = 0x171012;
            func_020944ec(data_02102254, (void *)0x04000400, 8);
            func_020944ec(func_02082198(), (void *)0x04000400, 0x30);
            *(volatile u32 *)0x04000400 = 0x1b19;
            func_020944ec(data_0210225c, (void *)0x04000400, 0x3c);
        } else func_020944ec(data_02102250, (void *)0x04000400, 0x48);
    }
    if (stage == 3) {
        ctx->flags &= ~0x40;
        ctx->callback(ctx);
        handled = ctx->flags & 0x40;
    } else handled = 0;
    if (mode == 0x20 || mode == 0x60) {
        n++;
        if (!handled && !(ctx->flags & 0x100)) {
            arg1 = ctx->pc[2];
            func_02084e0c(0x13, &arg1, 1);
        }
    }
    ctx->pc += n;
}
