typedef struct {
    unsigned short key;
    unsigned short val;
} Ent;

extern Ent data_020be820[];
extern Ent data_020be822[];

unsigned short func_0202b9b0(unsigned short key) {
    unsigned int i;
    for (i = 0; i < 0x62; i++) {
        if (key == data_020be820[i].key) {
            return data_020be822[i].key;
        }
    }
    return 3;
}
