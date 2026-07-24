/* func_02006950 — C-34 re-audit candidate. Typed struct-member access
 * (data_02104f1c.negc / .neg8 / .p1c) instead of raw cast-offset writes.
 * Store order is source order: +0xc (negc) then +0x8 (neg8), matching the
 * orig's instruction order. TWO calls pass the PRECEDING call's own return
 * value straight through as their first argument (orig leaves r0 untouched
 * between each pair -- no extra `mov r0, #0`): func_020929ac's result
 * feeds func_0207d4dc's first arg, and Task_PostLocked's result feeds the
 * second func_020983f4 call's first arg.
 *
 * C-34 dual-pool fix: orig has 2 distinct pool slots for data_02104f1c
 * (one symbolic, one a literal-hex trim-dodge) -- Fill32's dst argument
 * uses a raw literal-address-cast (proven recipe, see
 * src/main/func_0202a1cc.c) while the negc/neg8/p1c writes use the typed
 * struct symbol, so they're two distinct identifiers at the mwcc IR
 * level and don't get address-CSE'd into a single pool word.
 */

typedef struct {
    char _pad_00[0x8];
    int  neg8; /* +0x8 */
    int  negc; /* +0xc */
    char _pad_10[0xc];
    int  p1c;  /* +0x1c */
} Glob02104f1c;

extern Glob02104f1c data_02104f1c;
extern void Fill32(unsigned int value, void *dst, unsigned int size);
extern int  Task_PostLocked(int a0, int a1, int a2);
extern int  func_0207d4dc(int a0, int a1, int a2);
extern void func_02090624(int a0);
extern int  func_020929ac(int a0, int a1, int a2);
extern int  func_02092c78(int a0);
extern int  func_02092c8c(int a0);
extern int  func_020983f4(int a0, int a1);

void func_02006950(void)
{
    int top, cur, size, handle;

    Fill32(0, (void *)0x02104f1c, 0x20);
    data_02104f1c.negc = -1;
    data_02104f1c.neg8 = -1;
    top = func_02092c78(0);
    cur = func_02092c8c(0);
    size = (cur & ~3) - ((top + 3) & ~3);
    data_02104f1c.p1c = func_0207d4dc(func_020929ac(0, size, 4), size, 0);
    func_02090624(0x40000);
    handle = func_020983f4(0, 0);
    func_020983f4(Task_PostLocked(handle, 4, 4), handle);
}
