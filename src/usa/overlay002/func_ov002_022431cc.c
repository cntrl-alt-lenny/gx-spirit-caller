/* func_ov002_022431cc: outer dispatch on self->f_c (u16 "phase" state,
 * values 1/3 share a body, 2 is separate). The 1/3 body is itself a dense
 * jump table on data_ov002_022ce1a8+0x5b8 (values 0-3, 0/1 share a body).
 * arg1 is an unused-by-this-function pass-through carried only for the two
 * func_ov002_0223f59c/func_ov002_0228de2c forwarding calls (confirmed via
 * the .s: r1 is never written anywhere in this function, yet both callees'
 * own matched signatures take a real 2nd int arg).
 */
typedef struct {
    unsigned short f_0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
    char pad4[0xc - 0x4];
    unsigned short f_c;
} Self;

struct CE288 {
    char pad[0x5b8];
    int f_5b8;
};

extern int data_ov002_022cd664[];
extern struct CE288 data_ov002_022ce1a8;
extern char data_ov002_022d008c[];

extern int func_0202b0ac(int a0);
extern void func_ov002_021ae320(int a, void *b);
extern int func_ov002_021b9dec(int byte0, int byte1);
extern int func_ov002_0223dbd0(void *self, int a, int b);
extern int func_ov002_0223dda4(void *arg0, int arg1);
extern int func_ov002_0223f59c(void *self, int arg1);
extern void func_ov002_022574e0(void);
extern void func_ov002_02259274(int arg0, int arg1, int arg2);
extern int func_ov002_0225930c(void);
extern int func_ov002_0228de2c(void *self, int arg1, unsigned short f0);
extern void func_ov002_0229cd4c(void *buf, int fmtId, int val);

int func_ov002_022431cc(Self *self, int arg1) {
    char buf[0x100];

    switch (self->f_c) {
    case 3:
    case 1:
        switch (data_ov002_022ce1a8.f_5b8) {
        case 0:
        case 1:
            self->f_c = 1;
            if (func_ov002_0223f59c(self, arg1) != 0) {
                data_ov002_022ce1a8.f_5b8 = 2;
            }
            return 0;
        case 2: {
            int v;
            int b0, b1;
            int val;
            self->f_c = 3;
            if (data_ov002_022cd664[self->bit0] == 1) {
                return func_ov002_0228de2c(self, arg1, self->f_0);
            }
            v = func_ov002_0223dda4(self, 0);
            b1 = (unsigned char)((v & 0xffff) >> 8);
            b0 = v & 0xff;
            val = func_0202b0ac(func_ov002_021b9dec(b0, b1));
            func_ov002_0229cd4c(buf, 0x45, val);
            func_ov002_021ae320(self->bit0, buf);
            func_ov002_02259274(self->bit0, self->f_0, (int)func_ov002_022574e0);
            data_ov002_022ce1a8.f_5b8 = data_ov002_022ce1a8.f_5b8 + 1;
            return 0;
        }
        case 3:
            if (func_ov002_0225930c() != 0) {
                int d70 = *(int *)(data_ov002_022d008c + 0xd70);
                int d74 = *(int *)(data_ov002_022d008c + 0xd74);
                int d78 = *(int *)(data_ov002_022d008c + 0xd78);
                func_ov002_0223dbd0(self, d70, d74 + d78);
                return 1;
            }
            data_ov002_022ce1a8.f_5b8 = data_ov002_022ce1a8.f_5b8 - 1;
            return 0;
        }
        break;
    case 2:
        return func_ov002_0223f59c(self, arg1);
    }
    return 1;
}
