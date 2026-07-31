typedef struct {
    void (*callback)(void *);
    unsigned int status;
    unsigned int block_marker;
    unsigned char _unk0c[0x14];
    unsigned char buffer[0x200];
} data_021a8b00_t;

data_021a8b00_t data_021a8b00;
