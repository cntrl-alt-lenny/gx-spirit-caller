typedef struct { char pad[0x2c]; int pos; } strm_t;
typedef struct { char pad[0x24]; int lo, hi, cur; } obj_t;
typedef struct Obj_t Obj_t;
extern unsigned short func_0202b0b4(int id);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void func_02098388(Obj_t *obj);
extern int func_02098038(void *strm, void *data);
extern int func_02097ea4(obj_t *p, int val, int mode);
extern int func_02038ad4(strm_t *strm, void *buf, int len);
extern int func_02097ff0(int *self);
extern void func_020928e8(void *buf, int len);
extern unsigned char data_020c6a9c[];
extern unsigned char data_02105eb8[];
void *func_0202be4c(int id) {
    unsigned char strm[0x48];
    int off;
    int index = func_0202b0b4(id);
    int size;
    int base;
    void *buf;
    if (index > 0) base = 0x20c;
    else base = 0;
    off = index * 0x434;
    size = index > 0 ? 0x434 : 0x640;
    func_02098388((Obj_t *)strm);
    func_02098038(strm, data_020c6a9c + 4);
    buf = (void *)Task_PostLocked((void *)size, 4, 0);
    func_02097ea4((obj_t *)strm, off + base, 0);
    func_02038ad4((strm_t *)strm, buf, size);
    func_02097ff0((int *)strm);
    func_020928e8(buf, size);
    data_02105eb8[index] |= 2;
    return buf;
}



