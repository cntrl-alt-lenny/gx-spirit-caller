/* func_ov009_021ab6d4: enable/disable entry o, remembering the request in
 * o[0x10]. On enable, lazily allocates the o[0x8] surface (func_02021174 over
 * data_020f8960) the first time, seeds frame o[0xc], registers the 0x29 cell
 * (func_02022228 on &o[0x14]) and arms func_0202c8f4(1,2). On disable, frees the
 * surface. Always re-commits the visibility via func_0202c96c. Returns 1.
 * (ov009_core.h) */
extern int func_02021174(void *);
extern void func_02021428(void);
extern void func_ov009_021ab66c(int *, int, int);
extern void func_02022228(int, void *);
extern void func_0202c8f4(int, int);
extern void func_02021278(void);
extern void func_0202c96c(int);
extern char data_020f8960[];
int func_ov009_021ab6d4(int *o, int a) {
    int s;
    o[4] = a;
    s = o[2];
    if (a != 0) {
        if (s == 0) {
            o[2] = func_02021174(data_020f8960);
            func_02021428();
            func_ov009_021ab66c(o, o[3], 1);
        }
        func_02022228(0x29, &o[5]);
        func_0202c8f4(1, 2);
    } else {
        if (s != 0) {
            func_02021278();
            o[2] = 0;
        }
    }
    func_0202c96c(o[4]);
    return 1;
}
