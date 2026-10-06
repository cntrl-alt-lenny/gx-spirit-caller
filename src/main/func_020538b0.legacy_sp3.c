typedef struct {
    char _pad0[0x6];
    unsigned short x6;
} Hdr;

extern Hdr data_0219e474;
extern unsigned char data_0219e47c[];
extern unsigned char data_020ffad8[];
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);

int func_020538b0(signed char *name, int len, unsigned char *hdr, int *out) {
    int v;

    if (len < 7) {
        return 1;
    }
    if (func_020a7440(hdr + 4, data_0219e47c, 4) != 0) {
        return 1;
    }
    if (*(unsigned short *)(hdr + 2) != data_0219e474.x6) {
        return 1;
    }
    if (func_020a7440((unsigned char *)name, data_020ffad8, 3) != 0) {
        return 1;
    }
    v = (name[3] << 24) & 0xff000000;
    v |= (name[4] << 16) & 0xff0000;
    v |= (name[5] << 8) & 0xff00;
    v |= name[6] & 0xff;
    *out = v;
    return 0;
}
