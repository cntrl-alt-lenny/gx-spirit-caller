/* func_02006934 — C-34 re-audit candidate. Typed struct-member access
 * (data_02104e3c_alias.negc / .neg8 / .p1c) instead of raw cast-offset writes.
 * Store order is source order: +0xc (negc) then +0x8 (neg8), matching the
 * orig's instruction order. TWO calls pass the PRECEDING call's own return
 * value straight through as their first argument (orig leaves r0 untouched
 * between each pair -- no extra `mov r0, #0`): func_020928c4's result
 * feeds func_0207d3f4's first arg, and Task_PostLocked's result feeds the
 * second func_02098300 call's first arg.
 *
 * C-34 dual-pool fix: orig has 2 distinct pool slots for data_02104e3c_alias
 * (one symbolic, one a literal-hex trim-dodge) -- Fill32's dst argument
 * uses a raw literal-address-cast (proven recipe, see
 * src/main/func_0202a178.c) while the negc/neg8/p1c writes use the typed
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

extern Glob02104f1c data_02104e3c_alias;
extern void Fill32(unsigned int value, void *dst, unsigned int size);
extern int  Task_PostLocked(int a0, int a1, int a2);
extern int  func_0207d3f4(int a0, int a1, int a2);
extern void func_0209053c(int a0);
extern int  func_020928c4(int a0, int a1, int a2);
extern int  func_02092b90(int a0);
extern int  func_02092ba4(int a0);
extern int  func_02098300(int a0, int a1);

void func_02006934(void)
{
    int top, cur, size, handle;

    Fill32(0, (void *)0x02104f1c, 0x20);
    data_02104e3c_alias.negc = -1;
    data_02104e3c_alias.neg8 = -1;
    top = func_02092b90(0);
    cur = func_02092ba4(0);
    size = (cur & ~3) - ((top + 3) & ~3);
    data_02104e3c_alias.p1c = func_0207d3f4(func_020928c4(0, size, 4), size, 0);
    func_0209053c(0x40000);
    handle = func_02098300(0, 0);
    func_02098300(Task_PostLocked(handle, 4, 4), handle);
}
