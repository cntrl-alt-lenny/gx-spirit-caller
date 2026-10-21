typedef unsigned char u8;
typedef struct Conn Conn;
typedef struct { int words[0x81]; } Result;
typedef void (*ResultCb)(Conn **pp, Result *res, void *user);
typedef struct { void *buf; int field4; const u8 *name; } Request;
extern int func_020aaf40(const u8 *a, const u8 *b);
extern int func_02055c70(Conn **pp, void *buf, int a2, int a3, ResultCb cb, void *user);
extern void func_02048314(Conn **pp, Result *res, void *user);
extern u8 data_020ff920[];
int func_02049270(Conn **pp, Request *req) {
    if (func_020aaf40(req->name, data_020ff920 + 8) != 0) return 0;
    func_02055c70(pp, req->buf, 0, 0, func_02048314, 0);
    return 1;
}
