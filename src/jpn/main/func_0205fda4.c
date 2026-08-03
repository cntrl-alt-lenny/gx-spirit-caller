/* func_0205fda4: 5-arg dispatcher (a,b,c,d,e). If e==0, default it to
 * &data_021010f0. Then chain 3 calls (0205c340, 020a978c ignoring
 * result, 02057d2c) with early-return on nonzero, finally calling
 * 0205c258 and returning its result.
 *
 *   ldr ip, [sp, #0x30]      ; e = 5th (stack) arg
 *   cmp ip, #0
 *   streq r0(&data_021010f0), [sp, #0x30]   ; e defaults in place
 *   ...
 *   bl func_0205c2cc(a, c, 0xc9, b); if (r) return r;
 *   bl func_020a9698(&buf, &data_021010f0+4, 1, d);
 *   bl func_02057cb8(a, c, &buf); if (r) return r;
 *   ldr r2, [sp, #0x30]        ; reload e (may be the defaulted value)
 *   return func_0205c1e4(a, c, e, -1);
 */

extern unsigned int data_021010f0[7];

extern int func_0205c2cc(int a, int c, int magic, int b);
extern int func_020a9698(void *buf, unsigned int *info, int one, int d);
extern int func_02057cb8(int a, int b, int c);
extern int func_0205c1e4(int a, int c, int e, int neg1);

int func_0205fda4(int a, int b, int c, int d, int e) {
    unsigned char buf[0x20];
    int r;

    if (e == 0) {
        e = (int)data_021010f0;
    }

    r = func_0205c2cc(a, c, 0xc9, b);
    if (r != 0) {
        return r;
    }

    func_020a9698(buf, data_021010f0 + 1, 1, d);

    r = func_02057cb8(a, c, (int)buf);
    if (r != 0) {
        return r;
    }

    r = func_0205c1e4(a, c, e, -1);
    return r ? r : 0;
}
