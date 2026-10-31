typedef struct { unsigned int w[26]; } Prefix;
typedef struct {
    short h0;
    unsigned char b2;
    unsigned char fl;
    char pad4[6];
    unsigned short ha;
    char padc[4];
} Slot;
typedef struct {
    Prefix prefix;
    char pad68[0x3c];
    Slot s[3];
} Obj;
typedef struct {
    char pad0[0xce];
    unsigned short b0 : 1;
    unsigned short b1 : 1;
} Flags;
struct F02023f4c {
    char pad[0xca];
    signed short fca;
    unsigned short fcc;
};
/* Fill32's assembly definition has no C parameters; its ABI uses r0-r2. */
extern void Fill32(unsigned int value, void *dest, unsigned int size);
extern int func_02023eb8(Flags *o);
extern int func_02023f28(char *p);
extern int func_02023f4c(struct F02023f4c *self);
int func_02023d88(Obj *o) {
    Prefix saved = o->prefix;
    int i;
    unsigned char *fp;
    Fill32(0, o, 0xd0);
    o->prefix = saved;
    ((Flags *)o)->b0 = 1;
    ((Flags *)o)->b1 = 1;
    func_02023eb8((Flags *)o);
    func_02023f28((char *)o);
    func_02023f4c((struct F02023f4c *)o);
    fp = (unsigned char *)o + 0xa7;
    for (i = 0; i < 3; i++, fp += 16) {
        o->s[i].h0 = -1;
        *fp &= ~1;
    }
    return 1;
}
