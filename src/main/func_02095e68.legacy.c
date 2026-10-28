typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 v[5]; } Item;
typedef struct { u16 v[6]; } Record;
typedef struct { u8 type; u8 pad; Item item; } Output;
int func_02095e68(u8 *base, Output *out, u32 *state) {
    u32 value;
    while (state[0] < *(u32 *)(base + 0x38)) {
        value = ((u32 *)(base + 0x3c))[state[0]];
        out->type = value;
        switch (out->type) {
        case 1: case 2: case 3: case 4: case 5:
            out->item = *(Item *)(base + (value >> 8));
            state[0]++;
            return 1;
        case 16: {
            u8 *p = base + (value >> 8);
            while (state[1] < p[1] - p[0] + 1) {
                *(Record *)out = ((Record *)(p + 2))[state[1]];
                state[1]++;
                return 1;
            }
            break;
        }
        case 17: {
            u8 *p = base + (value >> 8);
            while (state[1] < 8) {
                if (p[state[1]] == 0) break; {
                    *(Record *)out = ((Record *)(p + 8))[state[1]];
                    state[1]++;
                    return 1;
                }
            }
            break;
        }
        }
        state[0]++;
        state[1] = 0;
    }
    return 0;
}

