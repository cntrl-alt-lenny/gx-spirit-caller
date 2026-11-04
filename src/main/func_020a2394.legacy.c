typedef struct {
    char _pad_28[0x28];
    unsigned int base28;
    unsigned int size28;
    char _pad_30[8];
    unsigned int base38;
    unsigned int size38;
} Src020a21dc;
typedef struct {
    int f0, f4, f8, fc;
} Out020a21dc;
extern void func_020a21dc(Src020a21dc *src, int *modeptr, Out020a21dc *out, int *acc);
extern void func_02094688(const void *src, void *dst, int size);
extern int data_020c3630[];

void func_020a2394(char *out, Src020a21dc *src)
{
    int acc = 0x22c0000;
    int *mode = data_020c3630;
    Out020a21dc *entry;
    int i;
    char *payload;
    *(int *)out = *(int *)((char *)src + 0x24);
    *(int *)(out + 4) = *(int *)((char *)src + 0x34);
    payload = (char *)src + 0x160;
    entry = (Out020a21dc *)(out + 0xc);
    for (i = 0; i < 3; i++) {
        func_020a21dc(src, mode, entry, &acc);
        entry++;
        mode++;
    }
    func_02094688(payload, out + 0x3c, 0x88);
}

