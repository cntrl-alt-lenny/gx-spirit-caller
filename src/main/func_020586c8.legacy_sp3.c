#include <nitro/types.h>
extern char data_02100350[], data_02100364[], data_0210036c[];
extern void func_020453b4(void *p);
extern int func_02054e54(int a, int b);
extern int func_02054e70(int a);
extern int func_02057980(int *self, int a, char *b, int *c, int d, char *e);
extern void func_02058038(int *a0, char *a1, int a2);
extern void func_02058070(int *a, char *b, char *c);
extern void func_0205888c(void);
extern void func_0205bd58(int *self, int t);
extern void func_0205cab4(int *self, int *p);
extern int func_0205d560(int *self, void *fn, int z);
typedef struct S {
    char pad0[0x198];
    int v198;
    int v19c;
    int v1a0;
    char pad1[0x30];
    int h1d4;
    int mode;
    int v1dc;
    char pad2[0x0c];
    int v1ec;
    char pad3[4];
    char buf[0x10];
    int h204;
    char pad4[0x424 - 0x208];
    int v424;
    char pad5[0x0c];
    int *v434;
    char pad6[4];
    int v43c;
    int v440;
    char pad7[0x0c];
    int v450;
} S;
void func_020586c8(int *self, int flag) {
    S *s = (S *)*self;
    int out[2];
    int *p;
    int t;
    if (s->mode != 4) {
        if (s->mode != 0) {
            if (flag != 0 && s->mode == 3) {
                func_02058070(self, s->buf, data_02100350);
                func_02058038(self, s->buf, s->v198);
                func_02058070(self, s->buf, data_02100364);
            }
            func_02057980(self, s->h1d4, s->buf, out, 1, data_0210036c);
            if (s->h1d4 != -1) {
                func_02054e54(s->h1d4, 2);
                func_02054e70(s->h1d4);
                s->h1d4 = -1;
            }
            if (s->h204 != -1) {
                func_02054e54(s->h204, 2);
                func_02054e70(s->h204);
                s->h204 = -1;
            }
            s->mode = 4;
            s->v19c = 0;
            s->v1a0 = 0;
        }
        func_020453b4((void *)s->v1dc);
        s->v1dc = 0;
        func_020453b4((void *)s->v1ec);
        s->v1ec = 0;
        func_020453b4(*(void **)s->buf);
        *(int *)s->buf = 0;
        func_020453b4((void *)s->v440);
        s->v440 = 0;
        func_020453b4((void *)s->v450);
        s->v450 = 0;
        while ((t = s->v424) != 0) func_0205bd58(self, t);
        s->v424 = 0;
        p = s->v434;
        while (p != 0) {
            int *q = p;
            p = (int *)q[0x3c / 4];
            func_0205cab4(self, q);
        }
        s->v434 = 0;
        while (func_0205d560(self, func_0205888c, 0) == 0) {}
    }
}
