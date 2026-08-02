/* func_ov002_022425ac: dispatch on data_ov002_022ce288.f_5b8 (0 and 1 share
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

extern struct CE288 data_ov002_022ce288;
extern char data_ov002_022d0e6c[];

extern int func_ov002_0223fb48(Self *self, int arg1);
extern unsigned short func_ov002_0223de94(Self *self, int arg1);
extern int func_ov002_021c92ec(int a, int b);
extern void func_ov002_0226b0f0(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_0223dad0(Self *self, unsigned short val);
extern void func_ov002_0226b0b0(int arg0, int arg1, int arg2);

int func_ov002_022425ac(Self *self, int arg1) {
    switch (data_ov002_022ce288.f_5b8) {
    case 0:
    case 1:
        if (func_ov002_0223fb48(self, arg1) != 0) {
            data_ov002_022ce288.f_5b8 = 2;
        }
        return 0;
    case 2: {
        int v = func_ov002_0223de94(self, 0);
        int b0 = v & 0xff;
        int b1 = (unsigned char)((v & 0xffff) >> 8);
        int shift = func_ov002_021c92ec(b0, b1);
        func_ov002_0226b0f0(self->bit0, self->f_0, 1, (1 << shift) ^ 0xff);
        data_ov002_022ce288.f_5b8++;
        return 0;
    }
    case 3: {
        unsigned short val = *(unsigned short *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_0223dad0(self, val);
        func_ov002_0226b0b0(1 - self->bit0, 0x171f, val);
        data_ov002_022ce288.f_5b8++;
        return 0;
    }
    default:
        return 1;
    }
}
