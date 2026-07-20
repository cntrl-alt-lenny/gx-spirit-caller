/* Scene_Update: run the scene for one logical frame — step both sub-state
 * machines (021aaa40 / 021ab090) once per queued tick (+0x30 count), advancing
 * the global frame stamp on the catch-up ticks; then commit both subobjects. If
 * any tick reported completion, latch the state word to 3. Returns that flag.
 * (ov021_core.h) */
extern void func_02005688(void);
extern void func_02005f10(void);
extern int  func_ov021_021aa960(void *);
extern void func_ov021_021aafb0(void *);
extern void func_ov021_021aa740(void);
extern void func_ov021_021aa9f4(void *);
extern void func_ov021_021ab068(void *);
extern void func_ov021_021aa768(void);
extern char data_02103fcc[];
extern char data_ov021_0222cdf4[];
extern char data_ov021_0222ce64[];
extern int  data_ov021_021acda0[];
int Scene_Update(void) {
    int done = 0;
    int i = 0;
    char *g = data_02103fcc;
    if (*(int *)(g + 0x30) >= 0) {
        do {
            if (i > 0) {
                func_02005688();
                func_02005f10();
                *(int *)(g + 0x38) += 1;
            }
            if (func_ov021_021aa960(data_ov021_0222cdf4) != 0)
                done = 1;
            func_ov021_021aafb0(data_ov021_0222ce64);
            func_ov021_021aa740();
            i++;
        } while (i <= *(int *)(g + 0x30));
    }
    func_ov021_021aa9f4(data_ov021_0222cdf4);
    func_ov021_021ab068(data_ov021_0222ce64);
    func_ov021_021aa768();
    if (done != 0)
        data_ov021_021acda0[0] = 3;
    return done;
}
