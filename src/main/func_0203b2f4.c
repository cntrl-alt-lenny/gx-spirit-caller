typedef struct {
    short         sample;
    unsigned char index;
} adpcm_0203b2f4_t;

extern char data_027e0000[];
extern unsigned short data_027e0010[8][89];

void func_0203b2f4(adpcm_0203b2f4_t *state, const unsigned char *in, int count) {
    int sample;
    int index;
    int word;
    int diff;
    int i;

    index = in[2];
    sample = *(short *)in;
    in += 4;
    if (index < 0 || index >= 89) {
        index = 0;
    }
    for (i = 0; i < count; i++) {
        if ((i & 7) == 0) {
            word = *(int *)in;
            in += 4;
        }
        diff = data_027e0010[word & 7][index];
        if (word & 8) {
            sample -= diff;
            if (sample < -0x8000) {
                sample = -0x8000;
            }
        } else {
            sample += diff;
            if (sample > 0x7fff) {
                sample = 0x7fff;
            }
        }
        index += data_027e0000[word & 0xf];
        if (index < 0) {
            index = 0;
        } else if (index >= 89) {
            index = 88;
        }
        word >>= 4;
    }
    state->sample = sample;
    state->index = index;
}
