/* func_02075928: read a packet via func_02070ac0 into a local length
 * slot (looping while the returned length is a nonzero value < 5),
 * then dispatch on the first byte: 0x80 means a fixed 2-byte-header
 * frame, otherwise a length-prefixed frame (big-endian 16-bit length
 * at offset 3/4, +5 for the header). Both paths hand the computed
 * length to the data_0219eee0 callback to get a work buffer, validate
 * it via func_02075d74, and finish through func_02076b74/func_02075d44
 * /func_02075ae8 plus the data_0219ef0c completion callback. Returns
 * the connection's status byte (ctx->f_455), 9 on any error.
 */
typedef struct {
    char pad[0x454];
    unsigned char f_454;
    unsigned char f_455;
} Ctx;

extern unsigned char *func_02070ac0(int *out, void *conn);
extern void func_02070980(int x, void *conn);
extern void *(*data_0219eee0)(int);
extern void (*data_0219ef0c)(void *);
extern int func_02075d74(void *a, int b, void *conn);
extern void func_02076b74(void *ctx, void *p);
extern void func_02075d44(void *ctx, void *a, int b);
extern void func_02075ae8(void *ctx, void *a);

int func_02075928(void *param0)
{
    Ctx *ctx = *(Ctx **)((char *)param0 + 0xc);
    unsigned int buf;
    unsigned char *p;
    void *r6;

    for (;;) {
        p = func_02070ac0((int *)&buf, param0);
        if (buf == 0) {
            ctx->f_455 = 9;
            return 9;
        }
        if (buf >= 5) {
            break;
        }
    }

    if (p[0] == 0x80) {
        if (ctx->f_454 == 0) {
            goto err9;
        }
        if (ctx->f_455 != 0) {
            goto err9;
        }
        buf = p[1];
        func_02070980(2, param0);
        r6 = data_0219eee0(buf);
        if (r6 == 0) {
            ctx->f_455 = 9;
            return 9;
        }
        if (func_02075d74(r6, buf, param0) == 0 && *(unsigned char *)r6 == 1) {
            func_02076b74(ctx, (char *)r6 + 1);
        } else {
            ctx->f_455 = 9;
        }
        func_02075d44(ctx, r6, buf);
        data_0219ef0c(r6);
        goto final;

    err9:
        ctx->f_455 = 9;
        goto final;
    } else {
        buf = (p[3] << 8) + p[4] + 5;
        if (buf > 0x4805) {
            ctx->f_455 = 9;
            return 9;
        }
        r6 = data_0219eee0(buf);
        if (r6 == 0) {
            ctx->f_455 = 9;
            return 9;
        }
        if (func_02075d74(r6, buf, param0) != 0) {
            data_0219ef0c(r6);
            ctx->f_455 = 9;
            return 9;
        }
        func_02075ae8(ctx, r6);
    }
final:
    return ctx->f_455;
}
