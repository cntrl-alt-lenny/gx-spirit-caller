/* func_ov012_021cbe94: choose the opening transition for the overlay and rebuild
 * its graphics. Clears the pending mode/param (data_02103fcc[0x3c]/[0x40]); if a
 * forced-intro is queued (func_ov000_021ac680) uses mode 5/param 2, else — unless
 * a load is still busy (func_02018b14) — derives the param from the saved slot's
 * low nibble (data_ov012_021cc5fc[0x160]): slot 3 → param 0, otherwise
 * func_ov000_021ae3a0. Always re-runs func_ov012_021cbdd4. Returns 1.
 * (ov012_core.h) */
extern int func_ov000_021ac680(void *);
extern int func_02018b14(void);
extern int func_ov000_021ae3a0(void);
extern void func_ov012_021cbdd4(void);
extern char data_02103fcc[];
extern char data_ov012_021cc72c[];
extern char data_ov012_021cc5fc[];
struct ov012_nib4 {
    unsigned f : 4;
};
int func_ov012_021cbe94(void) {
    char *d = data_ov012_021cc5fc;
    *(int *)(data_02103fcc + 0x3c) = 0;
    *(int *)(data_02103fcc + 0x40) = 0;
    if (func_ov000_021ac680(data_ov012_021cc72c) != 0) {
        *(int *)(data_02103fcc + 0x3c) = 5;
        *(int *)(data_02103fcc + 0x40) = 2;
    } else if (func_02018b14() == 0) {
        if (((struct ov012_nib4 *)(d + 0x160))->f == 3)
            *(int *)(data_02103fcc + 0x40) = 0;
        else
            *(int *)(data_02103fcc + 0x40) = func_ov000_021ae3a0();
        *(int *)(data_02103fcc + 0x3c) = ((struct ov012_nib4 *)(d + 0x160))->f;
    }
    func_ov012_021cbdd4();
    return 1;
}
