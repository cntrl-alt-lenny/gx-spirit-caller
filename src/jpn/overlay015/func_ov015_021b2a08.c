/* func_ov015_021b2a08: VRAM-bank selector — dispatch the 8 bank-setup helpers by
 * selector, returning the chosen helper's result (0 for out-of-range). One of a
 * 2-member family differing only in the 8 dispatched helpers (ov015_core.h). */
extern int func_0208de78(void);
extern int func_0208de24(void);
extern int func_0208ddac(void);
extern int func_0208dd04(void);
extern int func_0208de58(void);
extern int func_0208de04(void);
extern int func_0208dd64(void);
extern int func_0208dcb4(void);
int func_ov015_021b2a08(int sel) {
    switch (sel) {
    case 0:
        return func_0208de78();
    case 1:
        return func_0208de24();
    case 2:
        return func_0208ddac();
    case 3:
        return func_0208dd04();
    case 4:
        return func_0208de58();
    case 5:
        return func_0208de04();
    case 6:
        return func_0208dd64();
    case 7:
        return func_0208dcb4();
    default:
        return 0;
    }
}
