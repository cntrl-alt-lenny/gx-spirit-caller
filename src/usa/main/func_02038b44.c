typedef struct {
    unsigned int size24 : 24;
    unsigned int flag : 8;
} field1c_t;

typedef struct {
    char _pad_00[0x4];
    void *field_4;
    int field_8;
    char _pad_0c[0x1c - 0xc];
    field1c_t field_1c;
    char _pad_20[0x2c - 0x20];
} info_t;

typedef struct {
    int a, b;
} pair_t;

extern int FS_LoadOverlayInfo(void *info, int id, int type);
extern void func_02098294(void *strm);
extern void func_02098b7c(pair_t *out, info_t *info);
extern int func_02097f94(void *strm, pair_t p);
extern void func_02098ba4(info_t *info);
extern int func_02038a84(void *strm, void *buf, int len);
extern void func_02097efc(void *strm);
extern void func_020987b4(info_t *info);

int func_02038b44(int type) {
    info_t info;
    info_t *ip = &info;
    unsigned char strm[0x48];
    pair_t tmp;
    int size;
    int n;

    if (!FS_LoadOverlayInfo(ip, 0, type)) {
        return 0;
    }
    func_02098294(strm);
    func_02098b7c(&tmp, ip);
    if (!func_02097f94(strm, tmp)) {
        return 0;
    }
    if (ip->field_1c.flag & 1) {
        size = ip->field_1c.size24;
    } else {
        size = ip->field_8;
    }
    func_02098ba4(ip);
    n = func_02038a84(strm, ip->field_4, size);
    func_02097efc(strm);
    if (n != size) {
        return 0;
    }
    func_020987b4(ip);
    return 1;
}
