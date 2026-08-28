typedef struct {
    char _pad_00[0x2c];
    int *field_2c;
} card_inner_t;

typedef struct {
    card_inner_t *p0;
} card_ctx_t;

extern card_ctx_t data_0219a85c;
extern unsigned short func_0202b060(int id);
extern void *Task_PostLocked(int size, int align, int flags);
extern void func_02098294(void *strm);
extern void func_02097f44(void *strm, void *data);
extern int func_02097db0(void *strm, int off, int sel);
extern int func_02038a84(void *strm, void *buf, int len);
extern void func_02097efc(void *strm);
extern void func_02092800(void *buf, int len);

extern char data_020c69e8[];

void *func_0202bf3c(int id) {
    unsigned char strm[0x48];
    int off = func_0202b060(id);
    int *p = data_0219a85c.p0->field_2c + off;
    int start = p[0];
    int len = p[1] - start;
    void *buf;

    func_02098294(strm);
    func_02097f44(strm, data_020c69e8);
    buf = Task_PostLocked(len, 4, 0);
    func_02097db0(strm, start, 0);
    func_02038a84(strm, buf, len);
    func_02097efc(strm);
    func_02092800(buf, len);
    return buf;
}
