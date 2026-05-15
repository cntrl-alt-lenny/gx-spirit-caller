/* func_02099b30: `data->u16_34 & arg`. */

extern char data_021a82b4[];
unsigned int func_02099b30(unsigned int arg) {
    return *(unsigned short *)(data_021a82b4 + 0x34) & arg;
}
