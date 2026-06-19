/* func_ov006_021c73d4: allocate a handle, build a fixed command record on the
 * stack, submit it, and release the handle; return 1. (0201e5b8 command-
 * record family.) */
extern int  func_02006bf0(void *p, int b, int c);
extern void func_0201d428(void *cmd);
extern void func_0201e564(void *cmd);
extern void func_02006e00(int h);
extern char data_ov006_021ce0b0[];
int func_ov006_021c73d4(void) {
    char cmd[40];
    int h = func_02006bf0(data_ov006_021ce0b0, 4, 0);
    func_0201d428(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 2;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x4140;
    *(short *)(cmd + 16) = 96;
    func_0201e564(cmd);
    func_02006e00(h);
    return 1;
}
