/* func_ov002_02225614: if self's kind==0x16, pick a cd42c row by
 * whether self's low-9-bit id at +0x14 matches cd3f4.f_38, resolve via
 * func_ov002_021b939c, split into bytes, gate byte1<=4, then dispatch
 * func_ov002_021de3c0(self, byte0, byte1). */
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

extern char data_ov002_022cd314[];
extern char data_ov002_022cd34c[];
extern int func_ov002_021b939c(int a);
extern int func_ov002_021de3c0(int arg0, int arg1, int arg2);

int func_ov002_02225614(struct Ov002SelfBitKind *self) {
    int result;
    int byte0;
    unsigned int byte1;

    if (self->kind != 0x16) {
        goto fail;
    }
    {
        int match;
        int row;
        int rec;
        if (*(int *)((char *)data_ov002_022cd314 + 0x38)
            == ((struct Ov002F14Id *)((char *)self + 0x14))->id9) {
            match = 1;
        } else {
            match = 0;
        }
        row = match * 0x38;
        rec = *(int *)((char *)data_ov002_022cd34c + row);
        result = func_ov002_021b939c(rec);
    }
    byte0 = result;
    {
        unsigned short u = (unsigned short)result;
        byte1 = (unsigned char)(u >> 8);
    }
    if (byte1 > 4) {
        goto fail;
    }
    func_ov002_021de3c0((int)self, (unsigned char)byte0, byte1);
fail:
    return 0;
}
