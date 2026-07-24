/* func_ov002_0220d930: type-tag dispatch on halfword at self+2 (asymmetric
 * shift, bits 6:11). type==0x16 compares bit9 of the int field at +0x14
 * against bit0 of the tag halfword, returning 2 if they differ; type==0x6
 * returns 1; else 0. */

typedef struct {
    unsigned short f0;
    unsigned short h2;
    char pad2[0x14 - 4];
    int f14;
} Obj;

int func_ov002_0220d930(Obj *self) {
    unsigned int type = ((unsigned int)(self->h2 << 20)) >> 26;
    if (type == 0x16) {
        unsigned int bit0 = ((unsigned int)(self->h2 << 31)) >> 31;
        unsigned int bit9 = ((unsigned int)(self->f14 << 22)) >> 31;
        return bit9 == bit0 ? 0 : 2;
    }
    return type == 6;
}
