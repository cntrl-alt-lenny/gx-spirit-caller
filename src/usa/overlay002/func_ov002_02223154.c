#include "ov002_core.h"

typedef unsigned short u16;

struct S02223244 { u16 b0 : 1; u16 f1 : 5; };

extern int  func_ov002_021bbdcc(int player);
extern int  func_ov002_02257790(void *self, void *fn);
extern void func_ov002_0226afa4(int arg0, int arg1);
extern void func_ov002_0226af44(int arg0, int arg1, int arg2);
extern int  func_ov002_021b99c8(unsigned int bit, unsigned int field9);
extern void func_ov002_021d7b2c(void *a, void *b, void *c);
extern int  func_ov002_021debbc(int a, int b, int c);
extern void func_ov002_021f2bb8(void);
extern char data_ov002_022d0d8c[];

int func_ov002_02223154(struct Ov002Self *self) {
    int state = CE288->f_5a8;
    int player = CE288->f_5ac;

    switch (state) {
    case 0x80:
        CE288->f_5ac = D016C->f_cec;
        func_ov002_021e2a4c();
        return 0x7f;

    case 0x7f: {
        unsigned int row = *(unsigned int *)(data_ov002_022cf098 + (player & 1) * 0x868);
        unsigned int total = row + func_ov002_021bbdcc(player);
        if (total <= 5) return 0x78;
        if (row == 0) {
            if (func_ov002_02257790((void *)self, (void *)func_ov002_021f2bb8) == 0) return 0x78;
        }
        func_ov002_0226afa4(player, self->f0);
        return 0x7e;
    }

    case 0x7e: {
        unsigned int row = *(unsigned int *)(data_ov002_022cf098 + (player & 1) * 0x868);
        unsigned int total = row + func_ov002_021bbdcc(player);
        if (total <= 5) return 0x78;
        if (row == 0) {
            if (func_ov002_02257790((void *)self, (void *)func_ov002_021f2bb8) == 0) return 0x78;
        }
        {
            struct S02223244 *s2 = (struct S02223244 *)((char *)self + 2);
            func_ov002_0226af44(player, self->f0, (u16)((unsigned char)s2->b0 | ((unsigned char)s2->f1 << 8)));
        }
        return 0x7d;
    }

    case 0x7d: {
        int val = func_ov002_021b99c8(player, *(u16 *)(data_ov002_022d0d8c + 0xb2));
        if (val >= 0) {
            int *row = (int *)(data_ov002_022cf08c + (player & 1) * 0x868 + 0x120);
            func_ov002_021d7b2c((void *)player, (void *)(row + val), (void *)0);
        } else {
            int byte = (*(u16 *)(data_ov002_022d0d8c + 0xb0) >> 8) & 0xff;
            func_ov002_021debbc((int)self, player, byte);
        }
        return 0x7e;
    }

    case 0x78:
        if (player == D016C->f_cec) {
            CE288->f_5ac = player ^ 1;
            return 0x7f;
        }
        func_ov002_021e2b6c();
        return 0;
    }
    return 0;
}
