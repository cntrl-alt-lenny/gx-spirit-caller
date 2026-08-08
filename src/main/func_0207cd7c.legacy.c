typedef struct {
    unsigned char active;
    char pad_01[3];
    int field_4;
    int field_8;
    char pad_0c[0x24 - 0xc];
    int field_24;
} Data_021a0890_0207cd7c;

extern Data_021a0890_0207cd7c data_021a0890;
extern char data_021a089c[];
extern void func_02092844(void *p);

void func_0207cd7c(void) {
    if (data_021a0890.active != 0) {
        return;
    }
    data_021a0890.active = 1;
    data_021a0890.field_24 = 0;
    data_021a0890.field_8 = 0;
    data_021a0890.field_4 = 0;
    func_02092844(data_021a089c);
}
