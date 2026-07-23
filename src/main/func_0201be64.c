typedef struct {
    char pad[0x900];
    unsigned int pad2 : 24;
    unsigned int bit24 : 1;
    unsigned int pad3 : 7;
} SysWork0201be64;

extern void *GetSystemWork(void);
extern int func_020139b4(void);

int func_0201be64(void) {
    SysWork0201be64 *sw = GetSystemWork();
    if (func_020139b4() != 2) {
        goto ret0;
    }
    if (sw->bit24 == 0) {
        return 1;
    }
ret0:
    return 0;
}
