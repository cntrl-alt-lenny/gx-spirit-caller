/* func_ov006_021c1380: build+submit a command record for entry `arg1` (else
 * clear its region); return 1. (0201e5b8 command-record family — conditional,
 * fields scaled from `slot`. n=3 with 021c13c4/021c148c.) */
extern void func_02091554(void *out, void *a, int b);
extern int  func_02006bf0(void *p, int b, int c);
extern void func_0201d428(void *cmd);
extern void func_0201e564(void *cmd);
extern void func_02006e00(int h);
extern char *func_0208dcb4(void);
extern int  func_02094410(int a, void *b, int c);
extern int  data_ov006_021cb4e8[];
extern char data_ov006_021cdc88[];
int func_ov006_021c1380(void *q, int arg1, int slot) {
    char cmd[40];
    char buf[32];
    if (arg1 != 0) {
        int h;
        func_02091554(buf, data_ov006_021cdc88, data_ov006_021cb4e8[arg1]);
        h = func_02006bf0(buf, 4, 0);
        func_0201d428(cmd);
        *(int *)(cmd + 0) = h;
        *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
        *(int *)(cmd + 8) = -1;
        *(int *)(cmd + 12) = ((slot << 2) + 845) << 5;
        *(short *)(cmd + 16) = (slot + 9) << 5;
        func_0201e564(cmd);
        func_02006e00(h);
    } else {
        func_02094410(0, func_0208dcb4() + (((slot << 2) + 845) << 5), 128);
    }
    return 1;
}
