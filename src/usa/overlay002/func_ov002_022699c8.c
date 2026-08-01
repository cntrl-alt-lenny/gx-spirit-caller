typedef struct {
    char _pad[0x300];
    unsigned int flags;
} Ov002Cd968_t;
extern Ov002Cd968_t data_ov002_022cd888;

extern int func_ov002_02269668(void);
extern int func_ov002_02269784(void);
extern int func_ov002_02246968(void);
extern int func_ov002_022698b4(void);

int func_ov002_022699c8(void) {
    unsigned int flags = data_ov002_022cd888.flags;

    if ((flags << 19) >> 31) {
        if (func_ov002_02269668() != 0) {
            data_ov002_022cd888.flags &= ~0x1000;
        }
        return 1;
    }

    if ((flags << 21) >> 31) {
        if (func_ov002_02269784() != 0) {
            data_ov002_022cd888.flags &= ~0x400;
        }
        return 1;
    }

    if ((flags << 27) >> 31) {
        if (func_ov002_02246968() != 0) {
            data_ov002_022cd888.flags &= ~0x10;
        }
        return 1;
    }

    if ((flags << 17) >> 31) {
        if (func_ov002_022698b4() != 0) {
            data_ov002_022cd888.flags &= ~0x4000;
        }
        return 1;
    }

    return 0;
}
