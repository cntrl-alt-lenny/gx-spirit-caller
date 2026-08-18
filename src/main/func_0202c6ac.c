extern int func_0202c528(int id);
extern void *Task_PostLocked(int size, int align, int flags);
extern void func_02098388(void *strm);
extern void func_02098038(void *strm, void *data);
extern int func_02097ea4(void *strm, int off, int sel);
extern int func_02038ad4(void *strm, void *buf, int len);
extern void func_02097ff0(void *strm);
extern void func_020928e8(void *buf, int len);

extern char data_020c6b74[];

void *func_0202c6ac(int id) {
    unsigned char strm[0x48];
    int off = func_0202c528(id) * 0x1024;
    void *buf;

    func_02098388(strm);
    func_02098038(strm, data_020c6b74);
    buf = Task_PostLocked(0x1024, 4, 0);
    func_02097ea4(strm, off, 0);
    func_02038ad4(strm, buf, 0x1024);
    func_02097ff0(strm);
    func_020928e8(buf, 0x1024);
    return buf;
}
