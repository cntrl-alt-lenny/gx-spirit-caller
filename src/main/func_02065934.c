/* func_02065934: if param0 is null, build a local {header, buf[0x80]}
 * scratch record (header=param1, buf filled by func_020a9764) and use
 * &buf as the argument; otherwise pass param0 straight through. */

extern void func_020a9764(void *out, int size, const void *a, const void *b);
extern void *func_02065974(void *arg);

extern char data_021015d8[];
extern char data_0219e434[];

typedef struct {
    int header;
    char buf[0x80];
} Local02065934;

void *func_02065934(void *param0, int param1) {
    Local02065934 local;
    void *p;

    if (param0 == 0) {
        local.header = param1;
        func_020a9764(local.buf, 0x80, data_021015d8, data_0219e434);
        p = local.buf;
    } else {
        p = param0;
    }
    return func_02065974(p);
}
