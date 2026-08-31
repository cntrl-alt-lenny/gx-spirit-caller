struct M2CUnknown {
    int unk0;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
    int unk14;
    char _pad18[0x14];
    int unk2C;
    int unk30;
    int unk34;
};
#include <nitro/types.h>

s32 func_02006c0c(struct M2CUnknown *, int, int);                       /* extern */
int func_0202af40();                                  /* extern */
extern struct M2CUnknown data_020c697c;
extern struct M2CUnknown data_020c6990;
extern struct M2CUnknown data_020c69a4;
extern struct M2CUnknown data_020c69c0;
extern struct M2CUnknown data_020c69d4;
extern struct M2CUnknown data_020c69e8;
extern struct M2CUnknown data_020c69fc;
extern struct M2CUnknown data_020c6a10;
extern struct M2CUnknown *data_0219a93c;

void func_0202ae1c(s32 arg0) {
    func_0202af40();
    data_0219a93c->unk30 = func_02006c0c(&data_020c697c, 4, 0);
    data_0219a93c->unk34 = func_02006c0c(&data_020c6990, 4, 0);
    data_0219a93c->unk2C = func_02006c0c(&data_020c69a4, 4, 0);
    if (arg0 < 0) {
        return;
    }
    data_0219a93c->unk0 = arg0;
    data_0219a93c->unk8 = func_02006c0c(&data_020c69c0, 4, 0);
    data_0219a93c->unk4 = func_02006c0c(&data_020c69d4, 4, 0);
    data_0219a93c->unkC = func_02006c0c(&data_020c69e8, 4, 0);
    data_0219a93c->unk10 = func_02006c0c(&data_020c69fc, 4, 0);
    data_0219a93c->unk14 = func_02006c0c(&data_020c6a10, 4, 0);
}
