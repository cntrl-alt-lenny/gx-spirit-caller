typedef struct { volatile int field_0; int field_4, field_8, field_c, field_10; char pad[4]; int field_18; volatile int field_1c; } Obj_t;
typedef struct { char pad[0x24]; int lo, hi, cur; } obj_t;
typedef struct { char pad[0x2c]; int pos; } strm_t;
extern unsigned short func_0202b0b4(int id);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void func_02098388(Obj_t *obj);
extern int func_02098038(void *strm, void *data);
extern int func_02097ea4(obj_t *p, int val, int mode);
extern int func_02038ad4(strm_t *strm, void *buf, int len);
extern int func_02097ff0(int *self);
extern void func_020928e8(void *buf, int len);
extern char data_020c6ab4[];
void *func_0202befc(int id) {
    int stream[0x12];
    int index = func_0202b0b4(id);
    int base = index > 0 ? 0x20c : 0;
    int off = index * 0x124;
    int len = index > 0 ? 0x124 : 0x330;
    void *buf;

    func_02098388((Obj_t *)stream);
    func_02098038(stream, data_020c6ab4);
    buf = (void *)Task_PostLocked(len, 4, 0);
    func_02097ea4((obj_t *)stream, off + base, 0);
    func_02038ad4((strm_t *)stream, buf, len);
    func_02097ff0(stream);
    func_020928e8(buf, len);
    return buf;
}



