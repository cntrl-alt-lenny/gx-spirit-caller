/* func_ov002_022424c4: dispatch on data_ov002_022ce1a8.f_5b8 (0 and 1 share
 * a body; 2 and 3 each have their own body; default returns 1).
 */
typedef struct {
    unsigned short f_0;
    unsigned short bit0 : 1;
} Self;

struct CE288 {
    char pad[0x5b8];
    int f_5b8;
};

extern struct CE288 data_ov002_022ce1a8;
extern char data_ov002_022d0d8c[];

extern int func_ov002_0223fa60(Self *self, int arg1);
extern unsigned short func_ov002_0223dda4(Self *self, int arg1);
extern int func_ov002_021c920c(int a, int b);
extern void func_ov002_0226b000(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_0223d9e0(Self *self, unsigned short val);
extern void func_ov002_0226afc0(int arg0, int arg1, int arg2);

int func_ov002_022424c4(Self *self, int arg1) {
    switch (data_ov002_022ce1a8.f_5b8) {
    case 0:
    case 1:
        if (func_ov002_0223fa60(self, arg1) != 0) {
            data_ov002_022ce1a8.f_5b8 = 2;
        }
        return 0;
    case 2: {
        int v = func_ov002_0223dda4(self, 0);
        int b0 = v & 0xff;
        int b1 = (unsigned char)((v & 0xffff) >> 8);
        int shift = func_ov002_021c920c(b0, b1);
        func_ov002_0226b000(self->bit0, self->f_0, 1, (1 << shift) ^ 0xff);
        data_ov002_022ce1a8.f_5b8++;
        return 0;
    }
    case 3: {
        unsigned short val = *(unsigned short *)(data_ov002_022d0d8c + 0xb2);
        func_ov002_0223d9e0(self, val);
        func_ov002_0226afc0(1 - self->bit0, 0x171f, val);
        data_ov002_022ce1a8.f_5b8++;
        return 0;
    }
    default:
        return 1;
    }
}
