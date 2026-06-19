/* func_ov015_021b2a80: VRAM-bank selector (sub engine) — dispatch the 8 bank-
 * setup helpers by selector, returning the chosen helper's result (0 for out-of-
 * range). Sibling of 021b2b08 (ov015_core.h). */
extern int func_0208e138(void);
extern int func_0208e0e4(void);
extern int func_0208e038(void);
extern int func_0208df2c(void);
extern int func_0208e118(void);
extern int func_0208e0c4(void);
extern int func_0208dfb8(void);
extern int func_0208deac(void);
int func_ov015_021b2a80(int sel) {
    switch (sel) {
    case 0:
        return func_0208e138();
    case 1:
        return func_0208e0e4();
    case 2:
        return func_0208e038();
    case 3:
        return func_0208df2c();
    case 4:
        return func_0208e118();
    case 5:
        return func_0208e0c4();
    case 6:
        return func_0208dfb8();
    case 7:
        return func_0208deac();
    default:
        return 0;
    }
}
