typedef struct {
    unsigned short key;
    char rest[6];
} Elem_ov002_0223b3cc;

extern Elem_ov002_0223b3cc data_ov002_022ca9bc[96];

void *func_ov002_0223b3cc(unsigned short key) {
    unsigned int i;
    for (i = 0; i < 0x60; i++) {
        if (data_ov002_022ca9bc[i].key == key) {
            return &data_ov002_022ca9bc[i];
        }
    }
    return 0;
}
