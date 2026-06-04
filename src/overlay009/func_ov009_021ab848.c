/* func_ov009_021ab848: construct/reset the scene controller `o`. Clears the
 * 0x40-byte work block at data_ov009_021adc54, seeds o's fields (selection -1,
 * limit 7, flags), allocates its o[0x2c] surface (func_020211c8 over
 * data_020f8b30), then builds the sub-views (func_ov009_021ac214) and arms the
 * 021adc00 panel disabled (func_ov009_021ab7b4(.,0)). Returns 1. (ov009_core.h) */
extern void func_02094504(int, void *, int);
extern int func_020211c8(void *);
extern void func_0202147c(void);
extern void func_ov009_021ac214(void *);
extern void func_ov009_021ab7b4(void *, int);
extern char data_ov009_021adc54[];
extern char data_020f8b30[];
extern char data_ov009_021adc00[];
int func_ov009_021ab848(int *o) {
    func_02094504(0, data_ov009_021adc54, 0x40);
    o[12] = 0;
    o[9] = 0;
    o[10] = 0;
    o[6] = -1;
    o[7] = 7;
    o[0] = 0;
    o[13] = 1;
    o[14] = 0;
    o[11] = func_020211c8(data_020f8b30);
    func_0202147c();
    func_ov009_021ac214(o);
    func_ov009_021ab7b4(data_ov009_021adc00, 0);
    return 1;
}
