typedef struct {
    char _0[0x10];
    int  a;
    int  b;
    int  c;
    int  d;
} req_0206ceb8_t;

extern req_0206ceb8_t *func_0206bf94(void *a0, char *a1, int a2);
extern int func_0206cd64(void *a);
extern int func_0206be54(int *p, void *req);

int func_0206ceb8(char *s, int a, int b, int c, int d) {
    req_0206ceb8_t *r = func_0206bf94((void *)func_0206cd64, s, 1);

    r->a = a;
    r->b = b;
    r->c = c;
    r->d = d;
    return func_0206be54((int *)s, r);
}
