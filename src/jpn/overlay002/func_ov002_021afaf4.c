struct CdcSlot { unsigned int id : 13; unsigned int flag13 : 1; };
extern struct CdcSlot data_ov002_022cdba8[];
extern struct { char _pad0[4]; int f_4; char _pad1[4]; int f_c; } data_ov002_022cdb98;
extern struct { char _pad0[4]; int f4; } data_ov002_022cd65c;
extern int func_ov002_021c97ac(int a, int b, int c);

int func_ov002_021afaf4(int idx) {
    int bit = data_ov002_022cdba8[idx].flag13;
    if (data_ov002_022cdb98.f_4 == 4 && bit == (data_ov002_022cd65c.f4 ^ 1)) {
        if (func_ov002_021c97ac(bit, 15, idx) == 0)
            return 0;
    }
    if (data_ov002_022cdb98.f_4 == 0x4a)
        return 0;
    return data_ov002_022cdba8[idx].id;
}
