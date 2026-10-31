typedef struct { char pad[0x48]; int mode, inverse, unused, state, reset; char pad2[0x3bb0]; unsigned count[2]; unsigned cards[2][10]; } State;
typedef struct { unsigned count; char pad[8]; unsigned short cards[126]; } Source;
extern State data_ov004_0220b500;
extern Source data_02104cf8[2];
typedef struct { char pad[0xb9c]; int flag; } Global;
extern Global data_021040ac;
extern int func_0201cfa0(void);
extern void *func_0201d040(void);
extern int func_0201d060(void);
extern void func_0201d050(void *p);
int func_ov004_021caedc(void) {
    State *s = &data_ov004_0220b500;
    if (func_0201cfa0() != 0) {
        switch ((unsigned)func_0201d040()) {
        case 4: s->mode = 1; s->state = 0x13; break;
        case 5: s->mode = 1; s->state = 0x16; break;
        case 3: {
            unsigned count;
            int i;
            unsigned j;
            Source *src = data_02104cf8;
            State *dst = s;
            for (i = 0; i < 2; i++) {

                count = src->count;
                s->count[i] = count;
                for (j = 0; j < count; j++)
                    dst->cards[0][j] = src->cards[j];
                src++;
                dst = (State *)((char *)dst + 0x28);
            }
            s->mode = 3; s->state = 0x11;
            break;
        }
        case 1: s->mode = 1; s->state = 4; break;
        case 2:
            s->mode = 1;
            if (data_021040ac.flag == 0) s->state = 9;
            else s->state = 4;
            break;
        default: s->mode = 1; s->state = 4; break;
        }
    } else {
        if (func_0201d060() != 0) {
            s->mode = 0; s->state = 0; s->reset = 0;
            func_0201d050(0);
        } else { s->mode = 0; s->state = 1; }
    }
    s->inverse = s->mode == 0;
    return 1;
}





