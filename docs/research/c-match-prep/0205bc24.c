/* CAMPAIGN-PREP candidate for func_0205bc24 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch on field, result store-if-nonzero, default assert
 *   risk:       jump-table layout/case3-into-default ordering; the default error block's two-call sequence + sub sp,#4 may schedule differently
 *   confidence: med
 */
/* func_0205bc24: 5-way branch-table dispatch on p->state (+0). Each
 * matched case calls a handler into r4; default path asserts. If the
 * result is nonzero it is written to p->+0x1c. Returns the result.
 * Table (cmp #4; addls pc): 0->58a08,1->5d7e4,2->5af90,4->5febc,
 * default(incl 3 and >4)->error.
 */

extern unsigned char data_02100a8c[];
extern unsigned char data_02100ad4[];
extern unsigned char data_02100ad8[];
extern int  func_02058a08(void);
extern int  func_0205af90(void);
extern int  func_0205d7e4(void);
extern int  func_0205febc(void);
extern void func_020604a4(void *a0, void *fmt, int v);
extern void func_020a6d54(void *a, void *b, int c, int d);

typedef struct {
    int  state;       /* +0x00 */
    char _pad_04[0x1c - 0x04];
    int  result;      /* +0x1c */
} Obj;

int func_0205bc24(void *a0, Obj *p) {
    int r = 0;
    int s = p->state;
    switch (s) {
    case 0:
        r = func_02058a08();
        break;
    case 1:
        r = func_0205d7e4();
        break;
    case 2:
        r = func_0205af90();
        break;
    case 4:
        r = func_0205febc();
        break;
    default:
        func_020604a4(a0, data_02100a8c, s);
        func_020a6d54(data_02100ad4, data_02100ad8, 0, 0x146);
        break;
    }
    if (r != 0) {
        p->result = r;
    }
    return r;
}
