/* func_02075840: read a packet via func_020709d8 into a local length
 * slot (looping while the returned length is a nonzero value < 5),
 * then dispatch on the first byte: 0x80 means a fixed 2-byte-header
 * frame, otherwise a length-prefixed frame (big-endian 16-bit length
 * at offset 3/4, +5 for the header). Both paths hand the computed
 * length to the data_0219ee00 callback to get a work buffer, validate
 * it via func_02075c8c, and finish through func_02076a8c/func_02075c5c
 * /func_02075a00 plus the data_0219ee2c completion callback. Returns
 * the connection's status byte (ctx->f_455), 9 on any error.
 */
typedef struct {
    char pad[0x454];
    unsigned char f_454;
    unsigned char f_455;
} Ctx;

extern unsigned char *func_020709d8(int *out, void *conn);
extern void func_02070898(int x, void *conn);
extern void *(*data_0219ee00)(int);
extern void (*data_0219ee2c)(void *);
extern int func_02075c8c(void *a, int b, void *conn);
extern void func_02076a8c(void *ctx, void *p);
extern void func_02075c5c(void *ctx, void *a, int b);
extern void func_02075a00(void *ctx, void *a);

int func_02075840(void *param0)
{
    Ctx *ctx = *(Ctx **)((char *)param0 + 0xc);
    unsigned int buf;
    unsigned char *p;
    void *r6;

    for (;;) {
        p = func_020709d8((int *)&buf, param0);
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
        func_02070898(2, param0);
        r6 = data_0219ee00(buf);
        if (r6 == 0) {
            ctx->f_455 = 9;
            return 9;
        }
        if (func_02075c8c(r6, buf, param0) == 0 && *(unsigned char *)r6 == 1) {
            func_02076a8c(ctx, (char *)r6 + 1);
        } else {
            ctx->f_455 = 9;
        }
        func_02075c5c(ctx, r6, buf);
        data_0219ee2c(r6);
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
        r6 = data_0219ee00(buf);
        if (r6 == 0) {
            ctx->f_455 = 9;
            return 9;
        }
        if (func_02075c8c(r6, buf, param0) != 0) {
            data_0219ee2c(r6);
            ctx->f_455 = 9;
            return 9;
        }
        func_02075a00(ctx, r6);
    }
final:
    return ctx->f_455;
}
