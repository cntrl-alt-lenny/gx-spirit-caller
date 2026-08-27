#include "ov002_core.h"

struct Ov002SelfBitKind {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short _pad1 : 5;
    unsigned short kind : 6;
    unsigned short _pad2 : 4;
};

struct Ov002F14Id {
    unsigned int id9 : 9;
};

struct SmallSlot2 {
    unsigned short id : 13;
    unsigned short rest : 3;
};

extern char data_ov002_022cd314[];
extern char data_ov002_022cd34c[];
extern char data_ov002_022d0170[];
extern int func_ov002_021b939c(int a);
extern int func_ov002_021c8390(int a, int b);
extern int func_0202b89c(int id);
extern void func_ov002_021df728(void *self, int flag, int val);

int func_ov002_0222be60(struct Ov002SelfBitKind *self) {
    int result;
    int rec;

    if (self->kind != 0x16) {
        goto end;
    }

    {
        int match;
        if (*(int *)(data_ov002_022cd314 + 0x38)
            == ((struct Ov002F14Id *)((char *)self + 0x14))->id9) {
            match = 1;
        } else {
            match = 0;
        }
        rec = *(int *)(data_ov002_022cd34c + match * 0x38);
        result = func_ov002_021b939c(rec);
    }

    {
        unsigned short u = (unsigned short)result;
        unsigned int byte1 = (unsigned char)(u >> 8);
        int r0;

        if (byte1 <= 4) {
            r0 = func_ov002_021c8390((unsigned char)result, byte1);
        } else {
            struct SmallSlot2 *slot = (struct SmallSlot2 *)(data_ov002_022d0170 + rec * 4);
            r0 = func_0202b89c(slot->id);
        }
        func_ov002_021df728(self, 1 - self->b0, r0);
    }

end:
    return 0;
}
