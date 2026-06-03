/* func_ov015_021b2b08: VRAM-bank selector — dispatch the 8 bank-setup helpers by
 * selector, returning the chosen helper's result (0 for out-of-range). One of a
 * 2-member family differing only in the 8 dispatched helpers (ov015_core.h). */
extern int func_0208df60(void);
extern int func_0208df0c(void);
extern int func_0208de94(void);
extern int func_0208ddec(void);
extern int func_0208df40(void);
extern int func_0208deec(void);
extern int func_0208de4c(void);
extern int func_0208dd9c(void);
int func_ov015_021b2b08(int sel) {
    switch (sel) {
    case 0:
        return func_0208df60();
    case 1:
        return func_0208df0c();
    case 2:
        return func_0208de94();
    case 3:
        return func_0208ddec();
    case 4:
        return func_0208df40();
    case 5:
        return func_0208deec();
    case 6:
        return func_0208de4c();
    case 7:
        return func_0208dd9c();
    default:
        return 0;
    }
}
