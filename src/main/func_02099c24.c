/* func_02099c24: `data->u16_34 & arg`. */

extern char data_021a8394[];
unsigned int func_02099c24(unsigned int arg) {
    return *(unsigned short *)(data_021a8394 + 0x34) & arg;
}
