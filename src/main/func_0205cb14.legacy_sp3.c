struct Buffer { char *data; int size; int used; };
typedef struct { int status; int pad4; int sock; int result; int pad10[2]; struct Buffer buf; int field24; char queue[4]; } Req;
extern int func_0205cf10(int *ctx, Req *req);
extern int func_0205cbb8(int *ctx, Req *req);
extern int func_0205d15c(int *ctx, Req *req);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02100c90[], data_02100b64[];
int func_0205cb14(int *ctx, Req *req) {
    int ret = 0;
    if (req->status == 0x64)
        func_020a6d54((int)data_02100c90, (int)data_02100b64, 0, 0x1d9);
    if (req->status != 0x69) {
        if (req->pad4 != 0)
            ret = func_0205d15c(ctx, req);
        else
            ret = func_0205cf10(ctx, req);
    }
    if (ret == 0 && req->status == 0x69)
        ret = func_0205cbb8(ctx, req);
    return ret;
}
