/* func_0209f420: validates a bunch of preconditions on a context
 * (returned by func_0209dbb4()->field4), then builds a 0x30-byte
 * request packet (0xe tag, param1/param2>>1/param3/param4, plus a
 * 0x1c-byte payload copied from param5) and submits it via
 * func_0209dbc4. Returns an error code from the first failing check,
 * or 2 on submit failure, or the submit's own nonzero result.
 */
extern void *func_0209dbb4(void);
extern int func_0209da94(int a, int b, int c);
extern void func_020927e4(void *field, int width);
extern int func_0209e534(void);
extern int func_0209e61c(void);
extern void func_0209dd68(int code, void *param0);
extern void Fill32(int value, void *dest, int size);
extern void Copy32(void *src, void *dst, int n);
extern int func_0209dbc4(void *buf, int size);

int func_0209f420(void *param0, void *param1, int param2, int param3,
                   unsigned short param4, void *param5)
{
    char *r5;
    int rc;

    r5 = *(char **)((char *)func_0209dbb4() + 4);

    rc = func_0209da94(2, 7, 8);
    if (rc != 0) {
        return rc;
    }

    func_020927e4(r5 + 0x188, 2);
    func_020927e4(r5 + 0xc6, 2);

    if (*(unsigned short *)(r5 + 0x188) != 0) {
        if (*(unsigned short *)(r5 + 0xc6) != 1) {
            return 3;
        }
    }

    func_020927e4(r5 + 0xc, 4);
    if (*(int *)(r5 + 0xc) == 1) {
        return 3;
    }

    if ((param2 & 0x3f) != 0) {
        return 6;
    }
    if ((param4 & 0x1f) != 0) {
        return 6;
    }

    func_020927e4(r5 + 0x9c, 2);
    if (*(unsigned short *)(r5 + 0x9c) == 0) {
        if (param2 < func_0209e534()) {
            return 6;
        }
        if (param4 < func_0209e61c()) {
            return 6;
        }
    }

    func_0209dd68(0xe, param0);

    {
        struct {
            unsigned short f0;
            unsigned short pad;
            void *f4;
            int f8;
            int fc;
            int f10;
            char f14[0x1c];
        } buf;

        Fill32(0, &buf, 0x30);
        buf.f0 = 0xe;
        buf.f4 = param1;
        buf.f8 = (unsigned int)param2 >> 1;
        buf.fc = param3;
        buf.f10 = param4;
        Copy32(param5, buf.f14, 0x1c);

        rc = func_0209dbc4(&buf, 0x30);
    }

    return (rc == 0) ? 2 : rc;
}
