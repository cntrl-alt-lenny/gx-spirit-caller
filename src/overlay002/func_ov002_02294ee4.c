struct Self {
    unsigned short f0;
    struct {
        unsigned short bit0 : 1;
        unsigned short rest : 15;
    } f2;
};

extern char data_ov002_022cf288[];
extern int func_ov002_021bbf50(int bit0);
extern int func_ov002_021c3ae4(int bit0, unsigned short f0);
extern int func_ov002_021c3c50(unsigned int bit0, unsigned int k);
extern int func_ov002_02280980(int bit0);

/* func_ov002_02294ee4: if func_ov002_021bbf50(bit0)>=2, gate
 * func_ov002_021c3ae4(bit0, 0x19a5) -> return 1 on success. Else, if bit17
 * of data_ov002_022cf288[bit0] is clear, gate func_ov002_021c3c50(bit0,5) ->
 * return 1 on success. Finally return func_ov002_02280980(bit0) < 0. */
int func_ov002_02294ee4(struct Self *self) {
    if (func_ov002_021bbf50(self->f2.bit0) >= 2) {
        if (func_ov002_021c3ae4(self->f2.bit0, 0x19a5) != 0)
            return 1;
    }

    int flags = *(int *)(data_ov002_022cf288 + (self->f2.bit0 & 1) * 0x868);
    if ((((unsigned int)flags >> 17) & 1) == 0) {
        if (func_ov002_021c3c50(self->f2.bit0, 5) != 0)
            return 1;
    }

    return func_ov002_02280980(self->f2.bit0) < 0;
}
