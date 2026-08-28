/* func_020752ac: allocate an 0x83-byte packet via data_0219ee00, build a
 * fixed header + several copy/dispatch sub-calls against ctx (param0->0xc),
 * then submit the packet via data_0219ee2c and return its result.
 * Same ctx/callback family as func_02075928/func_02074720 (.legacy.c). */
typedef struct {
    char pad[0x454];
    unsigned char f_454;
    unsigned char f_455;
} Ctx02075394;

extern void *(*data_0219ee00)(int);
extern int (*data_0219ee2c)(void *);
extern void func_02094500(void *p, int val, int n);
extern void func_02094688(void *dst, void *src, int n);
extern void func_0207634c(void *ctx, void *p, int zero);
extern void func_02076264(void *ctx, void *p, int zero);
extern void func_02075c5c(void *ctx, void *p, int n);
extern char *func_02075d0c(void *ctx, void *p);
extern int func_020704ec(void *buf, void *p, int c, int d, void *param0);

int func_020752ac(void *param0)
{
    Ctx02075394 *ctx = *(Ctx02075394 **)((char *)param0 + 0xc);
    unsigned char *buf = data_0219ee00(0x83);
    char *r0;

    if (buf == 0) {
        ctx->f_455 = 9;
        return 9;
    }

    buf[0] = 0x14;
    buf[1] = 3;
    buf[2] = 0;
    buf[3] = 0;
    buf[4] = 1;
    buf[5] = 1;
    func_02094500((char *)ctx + 0x1cc, 0, 8);

    buf[6] = 0x16;
    buf[7] = 3;
    buf[8] = 0;
    buf[9] = 0;
    buf[0xa] = 0x28;
    buf[0xb] = 0x14;
    buf[0xc] = 0;
    buf[0xd] = 0;
    buf[0xe] = 0x24;
    func_02094688((char *)ctx + 0x3a4, (char *)ctx + 0x3fc, 0x58);

    func_0207634c(ctx, buf + 0xf, 0);
    func_02094688((char *)ctx + 0x3fc, (char *)ctx + 0x3a4, 0x58);
    func_02094688((char *)ctx + 0x2ec, (char *)ctx + 0x348, 0x5c);

    func_02076264(ctx, buf + 0x1f, 0);
    func_02094688((char *)ctx + 0x348, (char *)ctx + 0x2ec, 0x5c);

    func_02075c5c(ctx, buf + 0xb, 0x28);

    r0 = func_02075d0c(ctx, buf + 6);
    func_020704ec(buf, r0 + 6, 0, 0, param0);

    return data_0219ee2c(buf);
}
