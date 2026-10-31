typedef struct { unsigned short v[4]; } Palette;
typedef struct { unsigned short first, last; int pad04, pad08; int *recs; } Seg;
typedef struct { int *cur; int dir; int active; int fc; int len; int pad14; Seg *seg; } Obj;
typedef struct { unsigned short mode; char pad2[0x5be]; Obj *anim; char pad5c4[0x70]; unsigned flags; int timer; } State;
typedef struct { char pad[8]; unsigned short value; char rest[0x2a]; } Entry;
typedef struct { char pad[4]; struct { unsigned short low:8; unsigned short high:8; } index; } Selection;
typedef struct { char pad[0xa60]; int value; } Global;
typedef struct { char pad[0x18]; int value; } Counter;
extern Palette data_ov008_021b23b8;
extern State data_ov008_021b2780;
extern Entry data_ov008_021b2790[];
extern Selection data_ov008_021b2dc0;
extern Global data_02104f4c;
extern Counter data_ov008_021b2dc8;
extern void func_ov008_021ab008(unsigned short *, const unsigned short *, int, ...);
extern void func_ov008_021ab484(int, int, int, int, int, int, int, int);
extern void func_ov008_021abbf0(int, int, int, int);
extern int func_ov008_021b1ee0(void);
/* The original passes only the object; the second parameter is unused. */
extern int func_0207e840();
typedef struct { char pad[0xc]; int f_c; } state_0207e910_t;
extern int func_0207e910(state_0207e910_t *, ...);
extern int func_0207fd08(void *, ...);
extern int func_0207fd28(void *, int);
void func_ov008_021abcdc(void) {
    Palette pal = data_ov008_021b23b8;
    Entry *entry;
    func_ov008_021ab008((unsigned short *)0x0500060e, pal.v, 4, 0x00600100);
    if (data_ov008_021b2780.mode < 6 || data_ov008_021b2780.mode >= 9) {
        func_ov008_021ab484(0xe3, 0xa4, 0, 0, (data_ov008_021b2780.flags & 1) ? 8 : 7, 2, 0x400, 0);
    }
    if (data_ov008_021b2780.mode < 6 || data_ov008_021b2780.mode >= 10) {
        func_ov008_021ab484(2, 0xa4, 0, 0, (data_ov008_021b2780.flags & 2) ? 1 : 0, 2, 0x400, 0);
        func_ov008_021ab484(0x2e, 0xa4, 0, 0, (data_ov008_021b2780.flags & 4) ? 3 : 2, 2, 0x400, 0);
        func_ov008_021ab484(0x4a, 0xa4, 0, 0, (data_ov008_021b2780.flags & 8) ? 5 : 4, 2, 0x400, 0);
        func_ov008_021ab484(0xd, 7, 0, 0, 0x1e, 2, 0x400, 0);
        func_ov008_021ab484(0x6c, 0xac, 0, 1, 0, 2, 0x400, 0);
        if (data_ov008_021b2780.timer > 0) {
            Obj *obj = data_ov008_021b2780.anim;
            func_0207fd28(obj, 0x1000);
            if (obj->active != 0) {
                data_ov008_021b2780.timer++;
            } else {
                func_0207e840(obj);
                func_0207e910((state_0207e910_t *)obj, 0);
                func_0207fd08(obj, 0);
                obj->active = 1;
                data_ov008_021b2780.timer = 0;
            }
        }
    }
    func_ov008_021ab484(0x81, 3, 0, 0, 0x1d, 2, 0x400, 0);
    entry = &data_ov008_021b2790[data_ov008_021b2dc0.index.low + data_ov008_021b2dc0.index.high];
    func_ov008_021abbf0(0xe4, 2, data_02104f4c.value, 0);
    if (data_ov008_021b2780.mode < 6 || data_ov008_021b2780.mode >= 10) {
        func_ov008_021abbf0(0x52, 6, entry->value, 1);
        func_ov008_021abbf0(0xd1, 0xaa, data_ov008_021b2dc8.value, 0);
    }
    if (data_ov008_021b2780.mode < 1) return;
    if (data_ov008_021b2780.mode > 5) return;
    if (func_ov008_021b1ee0() != 0) {
        func_ov008_021ab484(0xe3, 0, 0, 0, (data_ov008_021b2780.flags & 0x400) ? 0x18 : 0x17, 2, 0x400, 0);
    }
    data_ov008_021b2780.flags &= ~0x400;
}




