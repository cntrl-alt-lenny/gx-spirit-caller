extern int func_0202b0b4(void);
extern void func_02098388(void *buf);
extern void func_02098038(void *buf, void *s);
extern void *Task_PostLocked(int size, int align, int flags);
extern void func_02097ea4(void *buf, int a, int b);
extern void func_02038ad4(void *buf, void *p, int size);
extern void func_02097ff0(void *buf);
extern void func_020928e8(void *p, int size);
extern char data_020c6a9c[];
extern unsigned char data_02105eb8[];

void *func_0202be4c(void)
{
    char buf[0x48];
    int off;
    int size;
    int base;
    int n;
    void *p;

    n = func_0202b0b4();

    if (n > 0) {
        off = 0x20c;
    } else {
        off = 0;
    }
    base = n * 0x434;
    size = (n > 0) ? 0x434 : 0x640;
    func_02098388(buf);
    func_02098038(buf, data_020c6a9c + 4);
    p = Task_PostLocked(size, 4, 0);
    func_02097ea4(buf, base + off, 0);
    func_02038ad4(buf, p, size);
    func_02097ff0(buf);
    func_020928e8(p, size);
    data_02105eb8[n] |= 2;
    return p;
}
