struct Ent {
    char _0[2];
    unsigned short f2;
    char _4[0x10];
    unsigned int f14lo9 : 9;
    unsigned int : 23;
};
extern char data_ov002_022cd314[];
extern char data_ov002_022cd364[];

int func_ov002_02207894(struct Ent *c) {
    int match;
    if (((unsigned)(c->f2 << 0x14) >> 0x1a) != 0x16)
        goto fail;
    if (*(unsigned int *)(data_ov002_022cd314 + 0x70) == c->f14lo9)
        match = 1;
    else
        match = 0;
    return *(int *)(data_ov002_022cd364 + match * 0x38) == 0xa;
fail:
    return 0;
}
