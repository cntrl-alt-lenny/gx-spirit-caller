/* func_ov002_021aff4c: replace the high byte of a u16 table entry, guarded
 * by index < 0x100. Byte-pack lever: (u8)lo | ((u8)hi << 8). */

extern unsigned short data_ov002_022ce088[];

void func_ov002_021aff4c(int index, int value) {
    if (index < 0x100) {
        unsigned short *arr = data_ov002_022ce088;
        arr[index] = (unsigned char)arr[index] | ((unsigned char)value << 8);
    }
}
