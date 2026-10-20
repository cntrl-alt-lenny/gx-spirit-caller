typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
struct Self {
    S021ff3bc hdr;
    char pad[0x10];
    int id;
};
struct Entry { unsigned int card : 13; unsigned int rest : 19; };
/* The original call leaves the callee's unused second argument unset. */
extern int func_ov002_021ff3bc();
extern int func_ov002_021b947c(int id);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern int func_0202e234(int x);
extern int func_ov002_021c33e4(int a, int b, int c);
int func_ov002_0220d638(struct Self *self) {
    int result;
    unsigned short lo;
    int byte1;
    int hi;
    int byte0;
    struct Entry *p;
    if (func_ov002_021ff3bc(&self->hdr) == 0) return 0;
    result = func_ov002_021b947c(self->id);
    lo = (unsigned short)result;
    hi = (unsigned short)((unsigned int)result >> 16);
    byte1 = (lo >> 8) & 0xff;
    byte0 = result & 0xff;
    p = func_ov002_021c93f0(byte0, byte1, hi);
    if (byte1 != 14) return 0;
    if (func_0202e234(p->card) != 0) {
        if (func_ov002_021c33e4(self->hdr.bit0, byte0, hi) != 0) return 1;
    }
    return 0;
}










