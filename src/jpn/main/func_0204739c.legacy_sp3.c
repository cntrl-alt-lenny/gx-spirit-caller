/* func_0204739c: teardown sequence. If *data_0219da0c is set, clears a
 * handful of its fields (calling a cleanup function first whenever the
 * field being cleared is itself nonzero), fires several unconditional
 * cleanup calls, then clears data_0219da0c itself. sub sp,#4 + fused
 * pop{pc} -> legacy_sp3 tier.
 */
struct Ctx02047408 {
    int f0;                  /* +0x0 */
    char _pad0[0x1c - 0x4];
    int f1c;                    /* +0x1c */
    char _pad1[0x364 - 0x20];
    int f364;                      /* +0x364 */
    char _pad2[0x36c - 0x368];
    unsigned char f36c;               /* +0x36c */
    char _pad3[0x438 - 0x36d];
    int f438;                            /* +0x438 */
};

extern struct Ctx02047408 *data_0219da0c;

extern void func_02047fdc(void);
extern void func_02048f24(void);
extern void func_0204f724(void);
extern void func_02052310(void);
extern void func_02055f10(void *a, int b, int c, int d);
extern void func_02055f78(void *a);
extern void func_02055fc4(void *a);
extern void func_02060edc(void);
extern void func_02062764(void);
extern void func_02065dcc(void);
extern void func_020672e0(void);
extern void func_02068ee0(void);

void func_0204739c(void)
{
    if (data_0219da0c == 0) {
        return;
    }

    if (data_0219da0c->f364 != 0) {
        func_020672e0();
        data_0219da0c->f364 = 0;
    }

    data_0219da0c->f36c = 0;
    if (data_0219da0c->f438 != 0) {
        func_02068ee0();
        data_0219da0c->f438 = 0;
    }

    func_02065dcc();
    func_02060edc();

    if (data_0219da0c->f1c != 0) {
        func_02055f10(&data_0219da0c->f1c, 0, 0, 0);
        func_02055f10(&data_0219da0c->f1c, 3, 0, 0);
        func_02055f10(&data_0219da0c->f1c, 1, 0, 0);
        func_02055f10(&data_0219da0c->f1c, 2, 0, 0);
        func_02055f78(&data_0219da0c->f1c);
        func_02055fc4(&data_0219da0c->f1c);
        data_0219da0c->f1c = 0;
    }

    func_02047fdc();
    func_02048f24();
    func_0204f724();
    func_02052310();

    if (data_0219da0c->f0 != 0) {
        func_02062764();
        data_0219da0c->f0 = 0;
    }

    data_0219da0c = 0;
}
