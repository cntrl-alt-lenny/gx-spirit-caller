typedef unsigned short u16;

struct RecF2 {
    u16 bit0 : 1;
    u16 _rest : 15;
};

struct Self0222ccb8 {
    u16 f0;
    struct RecF2 f2;
};

struct Ce288 {
    char _pad0[0x5a8];
    int f5a8;
    int f5ac;
};

struct D016c {
    char _pad0[0xd44];
    int fd44;
};

extern struct Ce288 data_ov002_022ce288;
extern struct D016c data_ov002_022d016c;
extern char data_ov002_022cf178[];

extern int func_ov002_021af9d0(int a, int b, int c, int d);
extern int func_ov002_021b004c(int a);
extern int func_ov002_021d7970(int arg0, int arg1, int arg2);
extern int func_ov002_021d7d0c(void *self, int a, int b);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int func_ov002_022536e8(int a, u16 b, int c);

int func_ov002_0222ccb8(struct Self0222ccb8 *self) {
    switch (data_ov002_022ce288.f5a8 - 0x7d) {
    case 3: {
        /* state == 0x80 */
        int val = *(int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868);
        data_ov002_022ce288.f5ac = val;
        return val != 0 ? 0x7f : 0;
    }
    case 2: {
        /* state == 0x7f */
        int val = *(int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868);
        if (val == 0) {
            return 0x7e;
        }
        func_ov002_021d7970(self->f2.bit0, 0, 0);
        return 0x7f;
    }
    case 1: {
        /* state == 0x7e */
        int local = data_ov002_022ce288.f5ac;
        int result = func_ov002_022536e8(self->f2.bit0, self->f0, 0);
        int clamped;
        if (result < local) {
            return 0;
        }
        clamped = local;
        if (clamped >= 0x20) {
            clamped = 0x20;
        }
        func_ov002_021af9d0(self->f2.bit0, clamped + 6, self->f0, 0);
        data_ov002_022ce288.f5ac = 0;
        func_ov002_021e2b3c();
        return 0x7d;
    }
    case 0: {
        /* state == 0x7d */
        unsigned int local = data_ov002_022ce288.f5ac;
        unsigned int other = data_ov002_022d016c.fd44;
        if (local < other) {
            int r = func_ov002_021b004c(local + 1);
            func_ov002_021d7d0c(self, self->f2.bit0, r);
            data_ov002_022ce288.f5ac++;
            return 0x7d;
        }
        func_ov002_021e2c5c();
        return 0;
    }
    default:
        return 0;
    }
}
