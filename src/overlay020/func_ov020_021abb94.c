typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 a, b, flags, d; } Entry;
extern char data_ov020_021aea28[];
extern u32 func_ov020_021aa8f0(void *a, Entry **out, void *c, int d, int priority, int palette);
void func_ov020_021abb94(void *a, Entry **out) {
    int info[2];
    void *handle = *(void **)(data_ov020_021aea28 + 0x2c);
    info[0] = (*(short *)(data_ov020_021aea28 + 0x44) + 0x77) << 12;
    info[1] = (*(short *)(data_ov020_021aea28 + 0x46) + 0xae) << 12;
    func_ov020_021aa8f0(a, out, handle, (int)info, 0, -1);
}

