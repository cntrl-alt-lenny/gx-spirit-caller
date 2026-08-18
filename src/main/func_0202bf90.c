typedef struct {
    char _pad_00[0x2c];
    int *field_2c;
} card_inner_t;

typedef struct {
    card_inner_t *p0;
} card_ctx_t;

extern card_ctx_t data_0219a93c;
extern unsigned short func_0202b0b4(int id);
extern void *Task_PostLocked(int size, int align, int flags);
extern void func_02098388(void *strm);
extern void func_02098038(void *strm, void *data);
extern int func_02097ea4(void *strm, int off, int sel);
extern int func_02038ad4(void *strm, void *buf, int len);
extern void func_02097ff0(void *strm);
extern void func_020928e8(void *buf, int len);

extern char data_020c6ac8[];

void *func_0202bf90(int id) {
    unsigned char strm[0x48];
    int off = func_0202b0b4(id);
    int *p = data_0219a93c.p0->field_2c + off;
    int start = p[0];
    int len = p[1] - start;
    void *buf;

    func_02098388(strm);
    func_02098038(strm, data_020c6ac8);
    buf = Task_PostLocked(len, 4, 0);
    func_02097ea4(strm, start, 0);
    func_02038ad4(strm, buf, len);
    func_02097ff0(strm);
    func_020928e8(buf, len);
    return buf;
}
