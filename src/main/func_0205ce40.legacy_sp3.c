typedef struct {
    int status;
    char _pad4[0x4];
    int x8;
    char _padc[0x24];
    int x30;
    char _pad34[0x4];
    void *queue;
} Req;

typedef struct {
    char _pad0[0x8];
    int x8;
    int xc;
} Item;

struct Self02053e58;

extern int func_02054140(void *p);
extern void *func_020540d0(char *s, int index);
extern int func_02057980(void *pp, int a1, Item *item, int *err, int a4, void *a5);
extern void func_02053e58(struct Self02053e58 *self, int idx);
extern char data_02100cb8[];

int func_0205ce40(void *pp, Req *req) {
    Item *item;
    int err;
    int r;

    if (req->x30 != 0) {
        return 0;
    }
    while (func_02054140(req->queue) != 0) {
        item = (Item *)func_020540d0(req->queue, 0);
        r = func_02057980(pp, req->x8, item, &err, 0, data_02100cb8);
        if (err != 0 || r != 0) {
            req->status = 0x6a;
            return 0;
        }
        if (item->xc != item->x8) {
            break;
        }
        func_02053e58((struct Self02053e58 *)req->queue, 0);
    }
    return 0;
}
