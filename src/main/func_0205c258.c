typedef struct {
    char _pad0[0x10];
    int deadline;
} Req;

extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern int func_020aaddc(const char *s);
extern int func_020a978c(char *buf, const char *fmt, int v);
extern int func_02057d2c(int a, int b, int c);
extern int func_02057d5c(void *pp, Req *req, char *data, int len);
extern int func_02057e60(void *arg0, void *arg1, int arg2);
extern int func_02054b9c(int *out);
extern char data_02100b54[];
extern char data_02100b64[];
extern char data_02100b70[];
extern char data_02100b74[];

int func_0205c258(void *pp, Req *req, char *data, int len) {
    char buf[0x24];
    int r;

    if (req == 0) {
        func_020a6d54(data_02100b54, data_02100b64, 0, 0x389);
    }
    if (data == 0) {
        data = data_02100b70;
    }
    if (len == -1) {
        len = func_020aaddc(data);
    }
    func_020a978c(buf, data_02100b74, len);
    r = func_02057d2c((int)pp, (int)req, (int)buf);
    if (r != 0) {
        return r;
    }
    r = func_02057d5c(pp, req, data, len);
    if (r != 0) {
        return r;
    }
    r = func_02057e60(pp, req, 0);
    if (r != 0) {
        return r;
    }
    req->deadline = func_02054b9c(0) + 300;
    return 0;
}
