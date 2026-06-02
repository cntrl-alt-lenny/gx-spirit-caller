/* func_ov006_021c74e0: allocate a handle, build a fixed command record on the
 * stack, submit it, and release the handle; return 1. (0201e5b8 command-
 * record family.) */
extern int  func_02006c0c(void *p, int b, int c);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern void func_02006e1c(int h);
extern char data_ov006_021ce1d0[];
int func_ov006_021c74e0(void) {
    char cmd[40];
    int h = func_02006c0c(data_ov006_021ce1d0, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 2;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x4140;
    *(short *)(cmd + 16) = 96;
    func_0201e5b8(cmd);
    func_02006e1c(h);
    return 1;
}
