extern int func_0202c4d4(int id);
extern void *Task_PostLocked(int size, int align, int flags);
extern void func_02098294(void *strm);
extern void func_02097f44(void *strm, void *data);
extern int func_02097db0(void *strm, int off, int sel);
extern int func_02038a84(void *strm, void *buf, int len);
extern void func_02097efc(void *strm);
extern void func_02092800(void *buf, int len);

extern char data_020c6a94[];

void *func_0202c658(int id) {
    unsigned char strm[0x48];
    int off = func_0202c4d4(id) * 0x1024;
    void *buf;

    func_02098294(strm);
    func_02097f44(strm, data_020c6a94);
    buf = Task_PostLocked(0x1024, 4, 0);
    func_02097db0(strm, off, 0);
    func_02038a84(strm, buf, 0x1024);
    func_02097efc(strm);
    func_02092800(buf, 0x1024);
    return buf;
}
