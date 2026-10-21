typedef struct {
    char pad[0xa74];
    unsigned int flags;
} State;
extern State data_02104f3c;
void func_02007f38(void) {
    data_02104f3c.flags = 0;
    data_02104f3c.flags |= 0x21;
    data_02104f3c.flags |= 0x8400;
    data_02104f3c.flags |= 0x52000000;
}

