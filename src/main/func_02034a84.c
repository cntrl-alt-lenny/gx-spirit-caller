typedef struct {
    unsigned char _0;
    unsigned char kind;
    unsigned char _2[5];
    unsigned char attr;
    unsigned char _8[4];
} entry_02034a84_t;

typedef struct {
    char              _pad[0xa];
    unsigned short    first;
    char              _c[0x8];
    unsigned short    end;
    char              _16[0x1e];
    entry_02034a84_t *table;
} info_02034a84_t;

typedef struct {
    char         _pad[0x34];
    unsigned int handle;
} obj_02034a84_t;

extern info_02034a84_t data_0219b2e0;
extern char data_0219b760[];
extern char data_0219c408[];

unsigned int func_02034a84(unsigned int x) {
    unsigned int kind;

    if (x & 0x8000000) {
        return x;
    }
    if (x > 0xffff) {
        if (x < (unsigned int)data_0219b760 || x > (unsigned int)data_0219c408) {
            return 0;
        }
        return ((obj_02034a84_t *)x)->handle;
    }
    kind = data_0219b2e0.table[x].kind & 0xf;
    if (x < data_0219b2e0.end && x >= data_0219b2e0.first) {
        x |= 0x1000000;
        if (data_0219b2e0.table[(unsigned short)x].attr & 0x80) {
            x |= 0x2000000;
        }
    }
    return x | 0x8000000 | (kind << 20);
}
