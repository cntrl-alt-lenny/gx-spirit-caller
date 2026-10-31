typedef struct { int f_0, f_4; unsigned short h_8, h_a; } state_4cl_t;
typedef struct { int field_0, field_4, field_8, field_c, field_10; char pad14[4]; int field_18, field_1c; } Obj_t;
typedef struct { unsigned short f0, f2, f4, pad6; int f8, fc, f10; } Ctl;
typedef struct { int f0, f4, f8; } Entry;
typedef struct { int f0, f4, f8, fc, f10; char pad14[0x44]; unsigned char f58; char pad59[3]; } Rec;
extern Ctl data_0219c480;
extern state_4cl_t data_0219c494;
extern Entry data_0219c4a0[];
extern Rec data_0219c4e8[];
extern void func_0207d1b8(state_4cl_t *p, unsigned short v);
extern void func_02098388(Obj_t *obj);
extern int func_02098038(void *p, void *arg);
extern int func_02097ff0(int *self);
extern void func_020945f4(void *dst, int val, int size);
int func_020397e0(void *arg, int mode) {
    int buf[18];
    Entry *entry = data_0219c4a0;
    Rec *rec = data_0219c4e8;
    int i;
    func_0207d1b8(&data_0219c494, 0);
    data_0219c480.f10 = 0;
    data_0219c480.fc = 0;
    data_0219c480.f0 = 0;
    data_0219c480.f2 = 0;
    data_0219c480.f0 = 0;
    if (arg == 0 && mode == 0) {
        data_0219c480.f4 = 1;
        for (i = 0; i < 6; i++, entry++) {
            entry->f0 = 0;
            entry->f4 = 0;
        }
        data_0219c480.f8 = 0;
    } else {
        data_0219c480.f4 = 0;
        if (arg != 0) {
            func_02098388((Obj_t *)buf);
            func_02098038(buf, arg);
            for (i = 6; i > 0; i--, entry++) {
                entry->f0 = buf[9];
                entry->f4 = 0;
            }
            data_0219c480.f8 = buf[9];
            func_02097ff0(buf);
        }
    }
    for (i = 0; i < 32; i++, rec++) {
        func_020945f4(rec, 0, 0x5c);
        rec->f4 = 0;
        rec->f58 = 0;
        rec->f0 = 0;
        rec->f10 = 0;
        rec->fc = 0;
    }
    return 1;
}
