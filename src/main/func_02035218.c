typedef struct { int x, y; } Vec;
typedef struct {
    char pad0[0x24];
    signed char pan;
    char pad25;
    signed char volume;
    char pad27[0x25];
    Vec pos;
    char pad54[4];
    unsigned short flags;
} Obj;
typedef struct {
    Vec pos;
    char pad8[8];
    unsigned short nearDist, farDist;
    char pad14[6];
    unsigned char volume;
} Listener;
extern Listener data_0219b3b4;
extern short data_020bef80[];
extern int Div(int numerator, int denominator);
/* BIOS square-root thunk consumes r0 and returns r0. */
extern int Sqrt(int value);
extern int func_02037dc0(int modeArg, void *arg1, void *arg2);
extern int func_02037fe4(int id, int volume, unsigned short frames);
extern int func_0208c66c(int y, int x);
void func_02035218(Obj *self) {
    int x, y;
    unsigned int distance;
    unsigned int flags;
    int volume;
    int nx, ny;
    Listener *listener;
    int old;
    Vec *pos;
    int pan;
    int scale;
    flags = self->flags;
    pos = &self->pos;
    listener = &data_0219b3b4;
    if (flags & 8) pos = *(Vec **)pos;
    old = flags & 0x40;
    if (!old) self->flags = flags | 0x40;
    x = pos->x;
    y = pos->y;
    if (!(flags & 4)) {
        y -= listener->pos.y;
        x -= listener->pos.x;
    }


    nx = -x << 12;
    if (x < 0) x = -x;
    ny = -y << 12;
    if (y < 0) y = -y;
    distance = Sqrt(x*x + y*y);
    if (!(flags & 1) && (!old || (flags & 0x10))) {
        volume = listener->volume;
        if (distance < listener->farDist) {
            volume = 0x7f;
            if (distance > listener->nearDist) {
                int span = listener->farDist - listener->nearDist;
                if (span > 0) volume -= Div((0x7f-listener->volume)*(distance-listener->nearDist),span);
            }
        }
        if (self->volume != volume) func_02037dc0((int)self, (void *)volume, 0);
    }
    if (flags & 2) return;
    if (old && !(flags & 0x20)) return;
    pan = 0x40;
    if (distance > 1 && distance >= listener->nearDist) {
        pan = func_0208c66c(ny,nx);
        if (pan >= 0x8000) pan = 0x10000-pan;
        pan >>= 8;
        if (pan > 0x7f) pan = 0x7f;
        scale = listener->volume;
        if (distance < listener->farDist) {
            int slope = Div((0x80-scale)<<8,listener->farDist-listener->nearDist);
            scale += (unsigned int)(slope*(listener->farDist-distance)) >> 8;
        }
        pan += ((0x40-pan)*data_020bef80[((scale<<14)>>11)*2]) >> 12;
    }
    if (self->pan != pan) func_02037fe4((int)self,pan,0);
}














