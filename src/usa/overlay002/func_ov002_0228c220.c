#include "ov002_core.h"

typedef struct {
    unsigned int cardId;
    void *handler;
} Ov002CardHandlerRecord;

struct Arg1 {
    u16 f0;
    u16 bit0   : 1;
    u16 _pad1  : 13;
    u16 bit14  : 1;
    u16 _pad2  : 1;
};

extern const Ov002CardHandlerRecord data_ov002_022c85a8[93];
extern int data_ov002_022cd444;
extern int func_ov002_0228bbc0(int player, const Ov002CardHandlerRecord *rec, void *arg1);
extern int func_0202e1e0(int id);
extern int func_ov002_0228c0c0(int player, void *arg1);

int func_ov002_0228c220(int player, struct Arg1 *arg1) {
    unsigned int i;
    const Ov002CardHandlerRecord *p;

    data_ov002_022cd444 = player;

    p = data_ov002_022c85a8;
    for (i = 0; i < 0x5d; i++, p++) {
        if (func_ov002_0228bbc0(player, p, arg1) != 0)
            return 1;
    }

    if (player == (int)(arg1->bit0 ^ arg1->bit14)
        && func_0202e1e0(arg1->f0) == 0 && arg1->f0 != 0x13f9) {
        return 0;
    }
    return func_ov002_0228c0c0(player, arg1);
}
