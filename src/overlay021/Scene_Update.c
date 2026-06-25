/* Scene_Update: run the scene for one logical frame — step both sub-state
 * machines (021aaa40 / 021ab090) once per queued tick (+0x30 count), advancing
 * the global frame stamp on the catch-up ticks; then commit both subobjects. If
 * any tick reported completion, latch the state word to 3. Returns that flag.
 * (ov021_core.h) */
extern void func_020056a4(void);
extern void func_02005f2c(void);
extern int  func_ov021_021aaa40(void *);
extern void func_ov021_021ab090(void *);
extern void func_ov021_021aa820(void);
extern void func_ov021_021aaad4(void *);
extern void func_ov021_021ab148(void *);
extern void func_ov021_021aa848(void);
extern char data_021040ac[];
extern char data_ov021_0222ced4[];
extern char data_ov021_0222cf44[];
extern int  data_ov021_021ace80[];
int Scene_Update(void) {
    int done = 0;
    int i = 0;
    char *g = data_021040ac;
    if (*(int *)(g + 0x30) >= 0) {
        do {
            if (i > 0) {
                func_020056a4();
                func_02005f2c();
                *(int *)(g + 0x38) += 1;
            }
            if (func_ov021_021aaa40(data_ov021_0222ced4) != 0)
                done = 1;
            func_ov021_021ab090(data_ov021_0222cf44);
            func_ov021_021aa820();
            i++;
        } while (i <= *(int *)(g + 0x30));
    }
    func_ov021_021aaad4(data_ov021_0222ced4);
    func_ov021_021ab148(data_ov021_0222cf44);
    func_ov021_021aa848();
    if (done != 0)
        data_ov021_021ace80[0] = 3;
    return done;
}
