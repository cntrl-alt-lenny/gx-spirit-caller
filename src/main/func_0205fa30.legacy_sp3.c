typedef struct {
    char _pad0[0x210];
    int x210;
} Owner;

typedef struct {
    char _pad0[0x8];
    int x8;
    char _padc[0xc];
    int x18;
} Req;

extern int func_0205be60(void *obj, int a1, int a2, void **out, int a4, int a5, int a6);
extern int func_0205fb88(Owner **pp, Req *req);
extern int func_020560a8(void *pp, int a1);

int func_0205fa30(Owner **pp, int a1, int a2, int a3, int a4) {
    Owner *o = *pp;
    Req *req;
    int r;

    o->x210++;
    r = func_0205be60(pp, 3, a1, (void **)&req, a2, a3, a4);
    if (r != 0) {
        return r;
    }
    r = func_0205fb88(pp, req);
    if (r != 0) {
        return r;
    }
    if (req->x8 != 0) {
        r = func_020560a8(pp, req->x18);
        if (r != 0) {
            return r;
        }
    }
    return 0;
}
