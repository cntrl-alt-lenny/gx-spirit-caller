/* Ov015_SelectVramBankSub: VRAM-bank selector (sub engine) — dispatch the 8 bank-
 * setup helpers by selector, returning the chosen helper's result (0 for out-of-
 * range). Sibling of 021b2b08 (ov015_core.h). */
extern int func_0208e220(void);
extern int func_0208e1cc(void);
extern int func_0208e120(void);
extern int func_0208e014(void);
extern int func_0208e200(void);
extern int func_0208e1ac(void);
extern int func_0208e0a0(void);
extern int func_0208df94(void);
int Ov015_SelectVramBankSub(int sel) {
    switch (sel) {
    case 0:
        return func_0208e220();
    case 1:
        return func_0208e1cc();
    case 2:
        return func_0208e120();
    case 3:
        return func_0208e014();
    case 4:
        return func_0208e200();
    case 5:
        return func_0208e1ac();
    case 6:
        return func_0208e0a0();
    case 7:
        return func_0208df94();
    default:
        return 0;
    }
}
