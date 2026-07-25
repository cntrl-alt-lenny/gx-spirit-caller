/* func_ov002_021afe6c: replace the high byte of a u16 table entry, guarded
 * by index < 0x100. Byte-pack lever: (u8)lo | ((u8)hi << 8). */

extern unsigned short data_ov002_022cdfa8[];

void func_ov002_021afe6c(int index, int value) {
    if (index < 0x100) {
        unsigned short *arr = data_ov002_022cdfa8;
        arr[index] = (unsigned char)arr[index] | ((unsigned char)value << 8);
    }
}
