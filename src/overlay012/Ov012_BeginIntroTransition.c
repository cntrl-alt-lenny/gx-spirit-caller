/* Ov012_BeginIntroTransition: choose the opening transition for the overlay and rebuild
 * its graphics. Clears the pending mode/param (data_021040ac[0x3c]/[0x40]); if a
 * forced-intro is queued (func_ov000_021ac760) uses mode 5/param 2, else — unless
 * a load is still busy (func_02018b48) — derives the param from the saved slot's
 * low nibble (data_ov012_021cc6dc[0x160]): slot 3 → param 0, otherwise
 * func_ov000_021ae4ac. Always re-runs func_ov012_021cbeb4. Returns 1.
 * (ov012_core.h) */
extern int func_ov000_021ac760(void *);
extern int func_02018b48(void);
extern int func_ov000_021ae4ac(void);
extern void func_ov012_021cbeb4(void);
extern char data_021040ac[];
extern char data_ov012_021cc80c[];
extern char data_ov012_021cc6dc[];
struct ov012_nib4 {
    unsigned f : 4;
};
int Ov012_BeginIntroTransition(void) {
    char *d = data_ov012_021cc6dc;
    *(int *)(data_021040ac + 0x3c) = 0;
    *(int *)(data_021040ac + 0x40) = 0;
    if (func_ov000_021ac760(data_ov012_021cc80c) != 0) {
        *(int *)(data_021040ac + 0x3c) = 5;
        *(int *)(data_021040ac + 0x40) = 2;
    } else if (func_02018b48() == 0) {
        if (((struct ov012_nib4 *)(d + 0x160))->f == 3)
            *(int *)(data_021040ac + 0x40) = 0;
        else
            *(int *)(data_021040ac + 0x40) = func_ov000_021ae4ac();
        *(int *)(data_021040ac + 0x3c) = ((struct ov012_nib4 *)(d + 0x160))->f;
    }
    func_ov012_021cbeb4();
    return 1;
}
