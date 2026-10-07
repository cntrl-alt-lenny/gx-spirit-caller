extern int *data_0219a93c;
extern char data_020c6a24[];
extern char data_020c6a38[];
extern int data_0219a948[];
extern int func_0202b100(int a);
extern int func_0202b0b4(int a);
extern void func_02098388(char *b);
extern void func_02098038(char *b, char *s);
extern void func_02097ea4(char *b, int n, int z);
extern void func_02092904(void *p, int n);
extern void func_02038ad4(char *b, void *p, int n);
extern void func_02097ff0(char *b);

int *func_0202b1a8(int a) {
    char buf[0x48];
    int n;
    int start;
    int len;
    if (*data_0219a93c != 0) {
        return (int *)func_0202b100(a);
    }
    n = func_0202b0b4(a) << 3;
    func_02098388(buf);
    func_02098038(buf, data_020c6a24);
    func_02097ea4(buf, n, 0);
    func_02092904(data_0219a948, 0x200);
    func_02038ad4(buf, data_0219a948, 12);
    func_02097ff0(buf);
    start = data_0219a948[0];
    len = data_0219a948[2] - start;
    func_02098388(buf);
    func_02098038(buf, data_020c6a38);
    func_02097ea4(buf, start, 0);
    func_02092904(data_0219a948, 0x200);
    func_02038ad4(buf, data_0219a948, len);
    func_02097ff0(buf);
    return data_0219a948;
}
