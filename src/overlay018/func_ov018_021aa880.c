/* func_ov018_021aa880: draw the two-layer label for slot a0 (mode-indexed). For
 * each of the two layers, look up its cell config in the [mode][a0] table
 * (row stride 0x20, element 0x10), build the sprite via func_0201edac /
 * func_0201ede4, blit it through func_0207f610 / func_0207f510 with the shared
 * palette, then free the handle.
 */

extern int func_ov018_021aa818(int a0);
extern int func_0201edac(int *out, int cfg);
extern int func_0201ede4(int *out, int cfg);
extern void func_0207f610(int s, int b, int c, void *d);
extern void func_0207f510(int s, int b, int c, void *d);
extern void func_02006e1c(int h);
extern char data_ov018_021ad798[];
extern char data_ov018_021ad884[];
extern char data_ov018_021ad79c[];
extern char data_ov018_021ad870[];

void func_ov018_021aa880(int a0, int a1, int a2, int a3) {
    int s1;
    int s0;
    int mode = func_ov018_021aa818(a0);
    int h1;
    int h2;
    h1 = func_0201edac(&s1, *(int *)(data_ov018_021ad798 + mode * 0x20 + a0 * 0x10));
    func_0207f610(s1, a2, a1, data_ov018_021ad884);
    func_02006e1c(h1);
    h2 = func_0201ede4(&s0, *(int *)(data_ov018_021ad79c + mode * 0x20 + a0 * 0x10));
    func_0207f510(s0, a3, a1, data_ov018_021ad870);
    func_02006e1c(h2);
}
