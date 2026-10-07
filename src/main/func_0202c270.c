typedef struct {
    int w0;
    int *p;
} Slot;

extern char *data_020be77c[];
extern char data_020c6b1c[];
extern char data_020c6b30[];
extern char data_020c6b44[];
extern Slot data_0219a93c;
extern int func_0202c3c8(int a);
extern int *func_02006c0c(char *a, int b, int c);
extern void OS_SPrintf(char *buf, char *fmt, char *arg);

void func_0202c270(int a) {
    char b1[0x20];
    char b2[0x20];
    char b3[0x20];
    char *s;
    func_0202c3c8(a);
    if (a < 0) {
        return;
    }
    s = data_020be77c[a];
    OS_SPrintf(b1, data_020c6b1c, s);
    data_0219a93c.p[0] = (int)func_02006c0c(b1, 4, 0);
    OS_SPrintf(b2, data_020c6b30, s);
    data_0219a93c.p[1] = (int)func_02006c0c(b2, 4, 0);
    OS_SPrintf(b3, data_020c6b44, s);
    data_0219a93c.p[2] = (int)func_02006c0c(b3, 4, 0);
}
