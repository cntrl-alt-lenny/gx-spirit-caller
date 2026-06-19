/* func_ov018_021aa7a0: draw the two-layer label for slot a0 (mode-indexed). For
 * each of the two layers, look up its cell config in the [mode][a0] table
 * (row stride 0x20, element 0x10), build the sprite via func_0201ed58 /
 * func_0201ed90, blit it through func_0207f528 / func_0207f428 with the shared
 * palette, then free the handle.
 */

extern int func_ov018_021aa738(int a0);
extern int func_0201ed58(int *out, int cfg);
extern int func_0201ed90(int *out, int cfg);
extern void func_0207f528(int s, int b, int c, void *d);
extern void func_0207f428(int s, int b, int c, void *d);
extern void func_02006e00(int h);
extern char data_ov018_021ad6b8[];
extern char data_ov018_021ad7a4[];
extern char data_ov018_021ad6bc[];
extern char data_ov018_021ad790[];

void func_ov018_021aa7a0(int a0, int a1, int a2, int a3) {
    int s1;
    int s0;
    int mode = func_ov018_021aa738(a0);
    int h1;
    int h2;
    h1 = func_0201ed58(&s1, *(int *)(data_ov018_021ad6b8 + mode * 0x20 + a0 * 0x10));
    func_0207f528(s1, a2, a1, data_ov018_021ad7a4);
    func_02006e00(h1);
    h2 = func_0201ed90(&s0, *(int *)(data_ov018_021ad6bc + mode * 0x20 + a0 * 0x10));
    func_0207f428(s0, a3, a1, data_ov018_021ad790);
    func_02006e00(h2);
}
