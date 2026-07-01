extern unsigned char data_0219b2e0[];
extern void func_02037c54(int a, int b, int c);
extern int func_0203ab9c(int a);

struct CardDef_02035ff4 {
    unsigned char b0;
    unsigned char b1;
    char _pad[0xc - 2];
};

struct Hdr_02035ff4 {
    char _pad0[0x8];
    short cnt;
    char _pad1[0x34 - 0xa];
    unsigned char *defs;
};

int func_02035ff4(unsigned char *obj)
{
    struct Hdr_02035ff4 *hd = (struct Hdr_02035ff4 *)data_0219b2e0;
    int id;
    int hi;

    id = (unsigned short)*(int *)(obj + 0x34);
    hi = ((struct CardDef_02035ff4 *)(hd->defs + id * 0xc))->b1 >> 4;
    if (hi != 0) {
        hd->cnt = hd->cnt - 1;
        if (hd->cnt <= 0) {
            hd->cnt = 0;
            func_02037c54(0, 0x7f, 8);
        }
    }
    return func_0203ab9c(*(int *)obj);
}
