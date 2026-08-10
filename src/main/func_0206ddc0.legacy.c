/* func_0206ddc0: conditionally runs a 4-call teardown sequence when
 * inner->f73 (a byte mode tag) is 0 or 4, always clears bits 0x6 of
 * inner->f70, dispatches func_0206bef4 with a mode-selected pointer,
 * runs an IRQ-guarded pair of calls, then sets bit 0x20 of f70.
 */

typedef struct {
    char _pad0[0x64];
    void *f64;
    void *f68;
    char _pad6c[0x70 - 0x6c];
    short f70;
    char _pad72[0x73 - 0x72];
    signed char f73;
} Inner0206ddc0;

extern void func_02091af4(void *a);
extern void func_02070c40(void);
extern void func_02070bac(void);
extern void func_02070f24(void);
extern void func_02071010(void);
extern void func_0206bef4(void *a, int b);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_0206e550(void *a);
extern void func_0206e568(void *a);

int func_0206ddc0(void *arg0) {
    Inner0206ddc0 *r4 = *(Inner0206ddc0 **)((char *)arg0 + 4);
    int flag = 1;
    signed char v;
    int saved;

    v = r4->f73;
    if (v != 0) {
        if (v != 4) flag = 0;
    }
    if (flag != 0) {
        func_02091af4((char *)r4->f68 + 0x20);
        func_02070c40();
        func_02070bac();
        func_02070f24();
    }

    func_02071010();

    r4->f70 &= ~0x6;

    func_0206bef4(r4->f73 == 2 ? r4->f68 : r4->f64, 0);

    saved = OS_DisableIrq();
    func_0206e550(r4);
    func_0206e568(r4);
    OS_RestoreIrq(saved);

    r4->f70 |= 0x20;
    return 0;
}
