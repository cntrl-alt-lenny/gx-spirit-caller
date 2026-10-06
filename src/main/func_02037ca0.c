typedef struct {
    int current;
    int target;
    unsigned short step_incr;
    unsigned short frames_left;
    int _reserved;
} anim_linear_t;

typedef struct {
    unsigned short value;
    char           _pad[0xe];
} level_02037ca0_t;

typedef struct {
    char          _pad[0x26];
    signed char   pan;
    unsigned char volume;
    unsigned char active;
    char          _29[0xb];
    unsigned int  id;
} ent_02037ca0_t;

extern int Div(int num, int denom);
extern anim_linear_t data_0219b3d0[];
extern level_02037ca0_t data_0219b3dc[];

int func_02037ca0(ent_02037ca0_t *e) {
    int kind = 0;
    int v;

    if (e->id & 0x1000000) {
        kind = 1;
        if (e->id & 0x2000000) {
            kind = 2;
        }
    }
    if (e->active == 0) {
        return 0;
    }
    v = Div(e->pan * e->volume, 0x7f);
    v = Div(v * (data_0219b3d0[kind].current >> 8), 0x7f);
    return Div(v * data_0219b3dc[kind].value, 0x7f);
}
