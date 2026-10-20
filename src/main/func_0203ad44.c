typedef struct { int current, target; short step_incr, frames_left; } anim_020385f8_t;
struct Obj { char pad0[0x3c]; int f3c; char pad40[8]; int f48; unsigned char f4c[1]; };
typedef struct { char pad[0x48]; int count; unsigned char bytes[1]; } T_0208822c;
typedef struct { char pad[0x1a]; unsigned char type; } Sound;
typedef struct {
    int f0;
    char obj[0x70];
    Sound *sound;
    char pad78[0x10];
    anim_020385f8_t f88, f94, fa0;
    char padac[4];
    unsigned short flags;
    char padb2[0xb];
    unsigned char volume;
    char padbe[6];
} Entry;
extern int data_0219d068;
extern Entry data_0219d388[];
extern short data_020c31f8[];
extern int func_020385f8(anim_020385f8_t *a);
extern void func_02088268(struct Obj *o, int base);
extern void func_0208822c(T_0208822c *p, int index, int a1);
void func_0203ad44(void) {
    int i;
    Entry *p = data_0219d388;
    int changed;
    int v;
    if (data_0219d068 != 0) data_0219d068 = 0;
    for (i = 0; i < 8; i++, p++) {
        if (!(p->flags & 0x8000) || (p->flags & 1) || (p->flags & 0x2000) || !(p->flags & 0x4000)) continue;
        changed = 0;
        if (func_020385f8(&p->f88)) {
            if ((p->flags & 0x1000) && p->f88.current == 0) {
                p->flags |= 0x801;
                continue;
            }
            changed = 1;
        }
        if (func_020385f8(&p->f94)) changed = 1;
        if (changed) {
            v = (((p->volume * 0x40a0) >> 14) * (((p->f94.current >> 8) * 0x40a0) >> 14)) >> 7;
            v = (v * (((p->f88.current >> 8) * 0x40a0) >> 14)) >> 7;
            if (v > 127) v = 127;
            func_02088268((struct Obj *)p->obj, data_020c31f8[v]);
        }
        if (func_020385f8(&p->fa0)) {
            v = p->fa0.current >> 8;
            if (p->sound->type == 2) {
                if (v >= 64) {
                    func_0208822c((T_0208822c *)p->obj, 0, (v - 64) << 1);
                    func_0208822c((T_0208822c *)p->obj, 1, 127);
                } else {
                    func_0208822c((T_0208822c *)p->obj, 0, 0);
                    func_0208822c((T_0208822c *)p->obj, 1, v << 1);
                }
            } else func_0208822c((T_0208822c *)p->obj, 0, v);
        }
    }
}
