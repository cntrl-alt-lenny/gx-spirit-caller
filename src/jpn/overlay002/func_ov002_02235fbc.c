/* func_ov002_02235fbc: CE288->f_5a8 state-machine ticker (sibling of the
 * other ov002 tickers). Dispatches on state-125 via a dense jump table
 * (0..3 -> 125..128), no default catch beyond the table's own range
 * check. */
#include "ov002_core.h"

typedef unsigned short u16;

struct S022360ac {
    u16 f0;
    u16 b0 : 1;
    u16 _pad0 : 15;
    char _pad1[8];
    u16 fc;
};

extern int func_ov002_021c2d54(int player, int arg1);
extern int func_ov002_021ca5b8(int arg0, int arg1);
extern void func_ov002_021d8038(int arg0, void *arg1, int arg2);
extern int func_ov002_021de55c(int a, int b, int c, int d);
extern void func_ov002_021e2a4c(void);
extern void func_ov002_021e2b6c(void);
extern int func_ov002_0223de48(void *self, int flag, int *outPtr);
extern int func_ov002_02257564(int a, int b, int c);

int func_ov002_02235fbc(struct S022360ac *self)
{
    int state = CE288->f_5a8;

    switch (state) {
    case 128: {
        int val, lo, hi;

        if (func_ov002_0223de48(self, 0, 0) == 0) {
            goto fail128;
        }

        val = func_ov002_0223dda4(self, 0);
        lo = val & 0xff;
        hi = (((u16)val) >> 8) & 0xff;

        if (func_ov002_02257564((int)self, lo, hi) == 0) {
            goto fail128;
        }
        if (func_ov002_021de55c((int)self, lo, hi, 0) == 0) {
            goto fail128;
        }

        {
            struct Ov002Slot *slot = (struct Ov002Slot *)
                (data_ov002_022cf08c + (lo & 1) * 0x868 + hi * 20 + 0x30);
            self->fc = slot->id;
        }
        return 0x7f;
fail128:
        return 0;
    }
    case 127: {
        int bit0 = self->b0;
        int opp = 1 - bit0;

        if (func_ov002_021ca5b8(bit0, opp) == 0) {
            return 0;
        }
        func_ov002_021e2a4c();
        return 0x7e;
    }
    case 126: {
        int opp = 1 - self->b0;
        int idx = func_ov002_021c2d54(opp, self->fc);

        if (idx < 0) {
            return 0x7d;
        }
        {
            int opp2 = 1 - self->b0;
            struct Ov002Slot *rec = (struct Ov002Slot *)
                (data_ov002_022cf08c + (opp2 & 1) * 0x868 + 0x418 + idx * 4);
            func_ov002_021d8038(opp2, rec, 1);
        }
        return 0x7e;
    }
    case 125:
        func_ov002_021e2b6c();
        return 0;
    default:
        return 0;
    }
}
