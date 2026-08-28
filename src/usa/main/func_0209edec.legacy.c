/* func_0209edec (main): pre-flight guard chain then a sequence of calls.
 * arg0 (r0) forwarded through; c (r1) is a context pointer.
 * Style A epilogue (sub sp #4 + pop{regs,lr}+bx lr) -> legacy tier.
 */

typedef struct {
    /* 0x00 */ int   f_0;      /* pointer/handle, guarded for cache-clean */
    /* 0x04 */ unsigned short f_4;     /* count/flag */
    char  _pad6[0x14 - 0x6];
    /* 0x14 */ unsigned short f_14;    /* selector -> picks 0x2a / 0x6 deltas */
    char  _pad16[0x34 - 0x16];
    /* 0x34 */ unsigned short f_34;    /* x coord */
    /* 0x36 */ unsigned short f_36;    /* y coord */
} ctx_0209eee0_t;

extern void func_02092800(void *addr, int len);
extern int  func_0209da94(int a, int b);
extern int  func_0209dc3c(int a, int b, void *p);
extern void func_0209dd68(int idx, int b);
extern void func_0209ed9c(ctx_0209eee0_t *c);

int func_0209edec(int arg0, ctx_0209eee0_t *c) {
    int r0;
    int x, y;

    r0 = func_0209da94(1, 2);
    if (r0 != 0) {
        return r0;
    }
    if (c == 0) {
        return 6;
    }
    if (c->f_4 != 0) {
        if (c->f_0 == 0) {
            return 6;
        }
    }

    x = c->f_34 + (c->f_14 != 0 ? 0x2a : 0);
    if (x > 0x200) {
        goto ret6;
    }
    y = c->f_36 + (c->f_14 != 0 ? 0x6 : 0);
    if (y <= 0x200) {
        goto cont;
    }
ret6:
    return 6;

cont:
    func_0209ed9c(c);
    func_0209dd68(7, arg0);
    func_02092800(c, 0x40);
    if (c->f_4 != 0) {
        func_02092800((void *)c->f_0, c->f_4);
    }
    r0 = func_0209dc3c(7, 1, c);
    if (r0 == 0) {
        return 2;
    }
    return r0;
}
