typedef struct {
    char _pad[0x300];
    unsigned int flags;
} Ov002Cd968_t;
extern Ov002Cd968_t data_ov002_022cd968;

extern int func_ov002_02269758(void);
extern int func_ov002_02269874(void);
extern int func_ov002_02246a50(void);
extern int func_ov002_022699a4(void);

int func_ov002_02269ab8(void) {
    unsigned int flags = data_ov002_022cd968.flags;

    if ((flags << 19) >> 31) {
        if (func_ov002_02269758() != 0) {
            data_ov002_022cd968.flags &= ~0x1000;
        }
        return 1;
    }

    if ((flags << 21) >> 31) {
        if (func_ov002_02269874() != 0) {
            data_ov002_022cd968.flags &= ~0x400;
        }
        return 1;
    }

    if ((flags << 27) >> 31) {
        if (func_ov002_02246a50() != 0) {
            data_ov002_022cd968.flags &= ~0x10;
        }
        return 1;
    }

    if ((flags << 17) >> 31) {
        if (func_ov002_022699a4() != 0) {
            data_ov002_022cd968.flags &= ~0x4000;
        }
        return 1;
    }

    return 0;
}
