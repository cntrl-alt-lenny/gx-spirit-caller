typedef unsigned char u8;
typedef unsigned int u32;
typedef struct { u8 pad[0xfc]; u32 f_fc; } state_021a18b8_t;
struct Obj { u8 *pc; int pad4; u32 flags; char pad[0x20]; void (*cb)(struct Obj *); char pad30[0x64]; u8 state; };
struct M44 { int m[16]; };
struct Mtx43; struct Mtx44;
extern state_021a18b8_t data_021a18b8;
extern int data_021a1904[];
extern int data_02102298[], data_0210229c[], data_021022a4[], data_021022c8[], data_021022d4[];
extern void func_02084e0c(int cmd, void *src, int n);
extern void func_02084fe0(void);
extern state_021a18b8_t *func_020820b8(void);
extern state_021a18b8_t *func_020820f8(void);
extern int *func_02082198(void);
extern void MTX_Copy43To44_(struct Mtx43 *src, struct Mtx44 *dst);
extern void func_0208b980(struct M44 *a, struct M44 *b, struct M44 *out);
extern void func_0208c1a0(int *v, int *out);
extern int func_0208c2e0(int *v);
extern int func_0208e664(int *out);
/* The assembly callee consumes three registers despite its no-argument C wrapper. */
extern void func_020944ec(void *src, void *dst, int size);
void func_02083718(struct Obj *o, int mode)
{
    int a, b;
    struct M44 matrix, tmp1, tmp2;
    int n = 2;
    int *pos = data_021022c8, *scale = data_021022d4, *out = data_021022a4;
    int state, busy;
    if (o->flags & 0x200) {
        if (mode == 0x40 || mode == 0x60) n++;
        if (mode == 0x20 || mode == 0x60) n++;
        o->pc += n;
        return;
    }
    if (mode == 0x40 || mode == 0x60) {
        n++;
        if (!(o->flags & 0x100)) {
            if (mode == 0x40) a = o->pc[2];
            else a = o->pc[3];
            func_02084e0c(0x14, &a, 1);
        }
    }
    if (o->cb != 0) state = o->state; else state = 0;
    if (state == 1) {
        o->flags &= ~0x40;
        o->cb(o);
        if (o->cb != 0) state = o->state; else state = 0;
        busy = o->flags & 0x40;
    } else busy = 0;
    if (!(o->flags & 0x100) && !busy) {
        func_02084fe0();
        *(volatile int *)0x04000400 = 0x151110;
        *(volatile int *)0x04000400 = 0;
        *(volatile int *)0x04000400 = 0;
        while (func_0208e664(matrix.m) != 0) {}
        if (data_021a18b8.f_fc & 1) {
            MTX_Copy43To44_((struct Mtx43 *)func_020820f8(), (struct Mtx44 *)&tmp1);
            func_0208b980(&matrix, &tmp1, &matrix);
        } else if (data_021a18b8.f_fc & 2) {
            MTX_Copy43To44_((struct Mtx43 *)data_021a1904, (struct Mtx44 *)&tmp2);
            func_0208b980(&matrix, &tmp2, &matrix);
        }
        pos[0] = matrix.m[12];
        pos[1] = matrix.m[13];
        pos[2] = matrix.m[14];
        scale[0] = func_0208c2e0(&matrix.m[0]);
        scale[1] = func_0208c2e0(&matrix.m[4]);
        scale[2] = func_0208c2e0(&matrix.m[8]);
        if (matrix.m[5] != 0 || matrix.m[6] != 0) {
            func_0208c1a0(&matrix.m[4], &out[3]);
            out[7] = -out[5];
            out[8] = out[4];
        } else {
            func_0208c1a0(&matrix.m[8], &out[6]);
            out[5] = -out[7];
            out[4] = out[8];
        }
        if (data_021a18b8.f_fc & 1) {
            *(volatile int *)0x04000400 = 0x171012;
            func_020944ec(data_0210229c, (void *)0x04000400, 8);
            func_020944ec(func_020820b8(), (void *)0x04000400, 0x30);
            *(volatile int *)0x04000400 = 0x1b19;
            func_020944ec(data_021022a4, (void *)0x04000400, 0x3c);
        } else if (data_021a18b8.f_fc & 2) {
            *(volatile int *)0x04000400 = 0x171012;
            func_020944ec(data_0210229c, (void *)0x04000400, 8);
            func_020944ec(func_02082198(), (void *)0x04000400, 0x30);
            *(volatile int *)0x04000400 = 0x1b19;
            func_020944ec(data_021022a4, (void *)0x04000400, 0x3c);
        } else func_020944ec(data_02102298, (void *)0x04000400, 0x48);
    }
    if (state == 3) {
        o->flags &= ~0x40;
        o->cb(o);
        busy = o->flags & 0x40;
    } else busy = 0;
    if (mode == 0x20 || mode == 0x60) {
        n++;
        if (!busy && !(o->flags & 0x100)) {
            b = o->pc[2];
            func_02084e0c(0x13, &b, 1);
        }
    }
    o->pc += n;
}



