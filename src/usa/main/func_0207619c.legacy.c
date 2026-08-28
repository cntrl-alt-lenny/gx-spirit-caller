/* func_0207619c: double-buffer round-trip copy + validate, twice.
 * Same ctx/callback family as func_02075394.legacy.c (identical
 * 0x3a4/0x3fc/0x58 and 0x2ec/0x348/0x5c copy shapes).
 */

extern void func_02094688(void *dst, void *src, int n);
extern void func_0207634c(void *ctx, void *p, int zero);
extern void func_02076264(void *ctx, void *p, int zero);
extern int func_020a734c(void *a, void *b, int n);

int func_0207619c(void *param0, void *param1) {
    char *ctx = (char *)param0;
    char local[0x14];

    func_02094688(ctx + 0x3a4, ctx + 0x3fc, 0x58);
    func_0207634c(param0, local, 1);
    func_02094688(ctx + 0x3fc, ctx + 0x3a4, 0x58);

    if (func_020a734c(param1, local, 0x10) != 0) {
        ctx[0x455] = 9;
        return 9;
    }

    func_02094688(ctx + 0x2ec, ctx + 0x348, 0x5c);
    func_02076264(param0, local, 1);
    func_02094688(ctx + 0x348, ctx + 0x2ec, 0x5c);

    if (func_020a734c((char *)param1 + 0x10, local, 0x14) != 0) {
        ctx[0x455] = 9;
        return 9;
    }

    ctx[0x455] = 6;
    return 6;
}
