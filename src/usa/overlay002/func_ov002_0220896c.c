/* func_ov002_0220896c: gate on self->kind==22, bit 14 of f_14 being set,
 * and bits 19-22 of f_14 equalling 14; then look up a 13-bit id from the
 * u16 at data_ov002_022d0170 indexed by f_14's low 9 bits (4-byte
 * stride) and return whether func_0202e1e0(id) is nonzero. */
#include "ov002_core.h"
extern int func_0202e1e0(int id);
extern char data_ov002_022d0170[];

struct Ov002SelfKindF14 {
    unsigned short f_0;
    unsigned short _lo : 6;
    unsigned short kind : 6;
    unsigned short _hi : 4;
    char _pad[16];
    int f_14;
};

struct D0250Entry {
    unsigned short id : 13;
    unsigned short _hi : 3;
};

int func_ov002_0220896c(struct Ov002SelfKindF14 *self) {
    int f14;
    unsigned idx4;
    struct D0250Entry *e;
    if (self->kind == 22) {
        f14 = self->f_14;
        if (((unsigned)(f14 << 17) >> 31) == 0) {
            return 0;
        }
        if (((unsigned)(f14 << 9) >> 28) != 0xe) {
            return 0;
        }
        idx4 = (unsigned)(f14 << 23) >> 21;
        e = (struct D0250Entry *)(data_ov002_022d0170 + idx4);
        return func_0202e1e0((int)e->id) != 0 ? 1 : 0;
    }
    return 0;
}
