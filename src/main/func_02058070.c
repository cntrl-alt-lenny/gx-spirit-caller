/* func_02058070: C-42 — sibling of 02057d2c (different helper2). */

extern int func_020aaddc(const char *s);
extern int func_020580a0(void *ctx, void *buf, char *src, int count);

int func_02058070(void *ctx, void *buf, char *s) {
    int r = func_020aaddc(s);
    return func_020580a0(ctx, buf, s, r);
}
