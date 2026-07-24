/* func_ov006_021c12fc: build+submit a command record for entry `arg1` (else
 * clear its region); return 1. (0201e5b8 command-record family — conditional,
 * fields scaled from `slot`. n=3 with 021c13c4/021c148c.) */
extern void OS_SPrintf(void *out, void *a, int b);
extern int  func_02006c0c(void *p, int b, int c);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern void Task_Invoke(int h);
extern char *func_0208dd9c(void);
extern int  func_02094504(int a, void *b, int c);
extern int  data_ov006_021cb60c[];
extern char data_ov006_021cdd78[];
int func_ov006_021c12fc(void *q, int arg1, int slot) {
    char cmd[40];
    char buf[32];
    if (arg1 != 0) {
        int h;
        OS_SPrintf(buf, data_ov006_021cdd78, data_ov006_021cb60c[arg1]);
        h = func_02006c0c(buf, 4, 0);
        func_0201d47c(cmd);
        *(int *)(cmd + 0) = h;
        *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
        *(int *)(cmd + 8) = -1;
        *(int *)(cmd + 12) = ((slot << 2) + 829) << 5;
        *(short *)(cmd + 16) = (slot + 5) << 5;
        func_0201e5b8(cmd);
        Task_Invoke(h);
    } else {
        func_02094504(0, func_0208dd9c() + (((slot << 2) + 829) << 5), 128);
    }
    return 1;
}
