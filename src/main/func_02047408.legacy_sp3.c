/* func_02047408: teardown sequence. If *data_0219daec is set, clears a
 * handful of its fields (calling a cleanup function first whenever the
 * field being cleared is itself nonzero), fires several unconditional
 * cleanup calls, then clears data_0219daec itself. sub sp,#4 + fused
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

extern struct Ctx02047408 *data_0219daec;

extern void func_02048050(void);
extern void func_02048f98(void);
extern void func_0204f798(void);
extern void func_02052384(void);
extern void func_02055f84(void *a, int b, int c, int d);
extern void func_02055fec(void *a);
extern void func_02056038(void *a);
extern void func_02060f50(void);
extern void func_020627d8(void);
extern void func_02065e40(void);
extern void func_02067354(void);
extern void func_02068f54(void);

void func_02047408(void)
{
    if (data_0219daec == 0) {
        return;
    }

    if (data_0219daec->f364 != 0) {
        func_02067354();
        data_0219daec->f364 = 0;
    }

    data_0219daec->f36c = 0;
    if (data_0219daec->f438 != 0) {
        func_02068f54();
        data_0219daec->f438 = 0;
    }

    func_02065e40();
    func_02060f50();

    if (data_0219daec->f1c != 0) {
        func_02055f84(&data_0219daec->f1c, 0, 0, 0);
        func_02055f84(&data_0219daec->f1c, 3, 0, 0);
        func_02055f84(&data_0219daec->f1c, 1, 0, 0);
        func_02055f84(&data_0219daec->f1c, 2, 0, 0);
        func_02055fec(&data_0219daec->f1c);
        func_02056038(&data_0219daec->f1c);
        data_0219daec->f1c = 0;
    }

    func_02048050();
    func_02048f98();
    func_0204f798();
    func_02052384();

    if (data_0219daec->f0 != 0) {
        func_020627d8();
        data_0219daec->f0 = 0;
    }

    data_0219daec = 0;
}
