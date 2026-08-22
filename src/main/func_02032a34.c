/* func_02032a34: part of the func_02032xxx ctx family (see func_02032864.c,
 * func_02032a18.c, func_02032c14.c, func_0203361c.c). Bails if
 * func_020334cc's guard trips; otherwise stashes a1 into a sub-object at
 * ctx+0x1fc, refreshes a couple of ctx fields via func_020459b4 /
 * func_02052ecc (2-word struct return), re-registers 3 dispatch
 * callbacks, and finally invokes ctx's own trailing callback with a1. */
typedef struct SubCtx02032a34 {
    char pad_c04[0xc04];
    int  field_c04;   /* +0xc04 (== ctx+0xe00) */
    int  field_c08;   /* +0xc08 (== ctx+0xe04) */
} SubCtx02032a34;

typedef struct Ctx02032a34 {
    char pad_dfc[0xdfc];
    int  field_dfc;          /* +0xdfc */
    char pad_eb8[0xeb8 - 0xe00];
    int  field_eb8;          /* +0xeb8 */
    char pad_ee4[0xee4 - 0xebc];
    void (*field_ee4)(int);  /* +0xee4 */
} Ctx02032a34;

extern int   func_020334cc(void *ctx);
extern void *func_020459b4(void);
extern long long func_02052ecc(void *p);
extern int   func_0204965c(int a0, int a1);
extern void  func_020336cc(void *ctx);
extern int   func_02049634(int a0, int a1);

extern void func_02032864(void);
extern void func_02032c14(void);
extern void func_02032a18(void);

void func_02032a34(int a0, int a1, Ctx02032a34 *ctx) {
    if (func_020334cc(ctx) != 0) {
        return;
    }
    SubCtx02032a34 *sub = (SubCtx02032a34 *)((char *)ctx + 0x1fc);
    sub->field_c08 = a1;
    ctx->field_eb8 = (int)func_020459b4();
    long long p = func_02052ecc((char *)sub + 0xc40);
    ctx->field_dfc = (int)p;
    sub->field_c04 = (int)(p >> 32);
    int dfc = ctx->field_dfc;
    if ((int)(p >> 32) == 0 && dfc == 0) {
        return;
    }
    func_0204965c((int)func_02032864, (int)ctx);
    func_020336cc(ctx);
    func_02049634((int)func_02032c14, (int)func_02032a18);
    if (ctx->field_ee4 != 0) {
        ctx->field_ee4(a1);
    }
}
