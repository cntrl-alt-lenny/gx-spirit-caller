/* func_ov009_021ab768: construct/reset the scene controller `o`. Clears the
 * 0x40-byte work block at data_ov009_021adb74, seeds o's fields (selection -1,
 * limit 7, flags), allocates its o[0x2c] surface (func_02021174 over
 * data_020f8a50), then builds the sub-views (func_ov009_021ac134) and arms the
 * 021adc00 panel disabled (func_ov009_021ab6d4(.,0)). Returns 1. (ov009_core.h) */
extern void func_02094410(int, void *, int);
extern int func_02021174(void *);
extern void func_02021428(void);
extern void func_ov009_021ac134(void *);
extern void func_ov009_021ab6d4(void *, int);
extern char data_ov009_021adb74[];
extern char data_020f8a50[];
extern char data_ov009_021adb20[];
int func_ov009_021ab768(int *o) {
    func_02094410(0, data_ov009_021adb74, 0x40);
    o[12] = 0;
    o[9] = 0;
    o[10] = 0;
    o[6] = -1;
    o[7] = 7;
    o[0] = 0;
    o[13] = 1;
    o[14] = 0;
    o[11] = func_02021174(data_020f8a50);
    func_02021428();
    func_ov009_021ac134(o);
    func_ov009_021ab6d4(data_ov009_021adb20, 0);
    return 1;
}
