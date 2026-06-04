/* func_ov009_021ab7b4: enable/disable entry o, remembering the request in
 * o[0x10]. On enable, lazily allocates the o[0x8] surface (func_020211c8 over
 * data_020f8a40) the first time, seeds frame o[0xc], registers the 0x29 cell
 * (func_0202227c on &o[0x14]) and arms func_0202c948(1,2). On disable, frees the
 * surface. Always re-commits the visibility via func_0202c9c0. Returns 1.
 * (ov009_core.h) */
extern int func_020211c8(void *);
extern void func_0202147c(void);
extern void func_ov009_021ab74c(int *, int, int);
extern void func_0202227c(int, void *);
extern void func_0202c948(int, int);
extern void func_020212cc(void);
extern void func_0202c9c0(int);
extern char data_020f8a40[];
int func_ov009_021ab7b4(int *o, int a) {
    int s;
    o[4] = a;
    s = o[2];
    if (a != 0) {
        if (s == 0) {
            o[2] = func_020211c8(data_020f8a40);
            func_0202147c();
            func_ov009_021ab74c(o, o[3], 1);
        }
        func_0202227c(0x29, &o[5]);
        func_0202c948(1, 2);
    } else {
        if (s != 0) {
            func_020212cc();
            o[2] = 0;
        }
    }
    func_0202c9c0(o[4]);
    return 1;
}
