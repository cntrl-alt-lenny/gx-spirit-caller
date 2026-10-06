typedef struct {
    unsigned char _0[0x7];
    unsigned char attr;
    unsigned char _8[0x4];
} def_02037fe4_t;

typedef struct {
    char            _pad[0x34];
    def_02037fe4_t *table;
} info_02037fe4_t;

typedef struct {
    char           _0[0x4];
    void          *handle;
    char           _8[0x1c];
    signed char    volume;
    signed char    volume_applied;
    char           _26[0xe];
    unsigned int   id;
    char           _38[0x30];
    unsigned short flags;
} ent_02037fe4_t;

extern info_02037fe4_t data_0219b2e0;
extern ent_02037fe4_t *func_02037b58(int id);
extern void func_0203c5a4(void *outer, int target, unsigned short frames);
extern void func_02087528(void *self, int arg);
extern void func_02087da4(void **pp, int mask, int value);

int func_02037fe4(int id, int volume, unsigned short frames) {
    ent_02037fe4_t *e = func_02037b58(id);
    int v;

    if (e == 0) {
        return 0;
    }
    e->volume = volume;
    if (e->flags & 0x6000) {
        return 1;
    }
    switch ((e->id >> 20) & 0xf) {
    case 4:
        func_0203c5a4(e->handle, volume, frames);
        break;
    case 5:
        func_02087528(e->handle, volume);
        break;
    default:
        if (data_0219b2e0.table[(unsigned short)e->id].attr & 0x40) {
            v = (volume - 0x40) * 2;
            if (v < 0) {
                v = 0;
            }
            func_02087da4(&e->handle, 1, v);
            v = volume * 2;
            if (v > 0x7f) {
                v = 0x7f;
            }
            func_02087da4(&e->handle, 2, v - 0x7f);
        } else {
            func_02087da4(&e->handle, 0xffff, volume - 0x40);
        }
        break;
    }
    e->volume_applied = e->volume;
    return 1;
}
