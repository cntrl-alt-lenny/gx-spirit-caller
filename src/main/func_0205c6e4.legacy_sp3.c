typedef struct {
    int status;
    char _pad4[0x8];
    int xc;
} Req;

typedef struct {
    char _pad0[0x18];
    int x18;
} Conn;

extern int func_0205be60(void *obj, int a1, int a2, void **out, int a4, int a5, int a6);
extern int func_0205a0ec(void *self, int arg1, int arg2);

int func_0205c6e4(void *pp, Req *req) {
    Conn *c;
    int r;

    r = func_0205be60(pp, 2, 0, (void **)&c, 0, 0, 0);
    if (r != 0) {
        return r;
    }
    r = func_0205a0ec(pp, req->xc, c->x18);
    if (r == 0) {
        req->status = 0x65;
        return 0;
    }
    return r;
}
