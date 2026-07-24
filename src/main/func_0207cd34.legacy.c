typedef void (*Fn)(void *, void *, void *, unsigned short);

typedef struct {
    unsigned char pad[0x28];
    Fn callback;
} Data_021a0890;

extern Data_021a0890 data_021a0890;

void func_0207cd34(char *a0) {
    Fn fn = data_021a0890.callback;

    if (fn == 0) {
        return;
    }
    fn(a0 + 0x1e, a0 + 0x18, a0 + 0x2c, *(unsigned short *)(a0 + 0x6));
}
