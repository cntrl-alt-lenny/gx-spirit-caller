/* func_020658c0: if param0 is null, build a local {header, buf[0x80]}
 * scratch record (header=param1, buf filled by func_020a9670) and use
 * &buf as the argument; otherwise pass param0 straight through. */

extern void func_020a9670(void *out, int size, const void *a, const void *b);
extern void *func_02065900(void *arg);

extern char data_021014f8[];
extern char data_0219e354[];

typedef struct {
    int header;
    char buf[0x80];
} Local02065934;

void *func_020658c0(void *param0, int param1) {
    Local02065934 local;
    void *p;

    if (param0 == 0) {
        local.header = param1;
        func_020a9670(local.buf, 0x80, data_021014f8, data_0219e354);
        p = local.buf;
    } else {
        p = param0;
    }
    return func_02065900(p);
}
