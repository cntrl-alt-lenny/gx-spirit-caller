typedef struct {
    char pad0[0x6c];
    unsigned char kind;
    char pad6d[7];
    int destination;
    char pad78[0x58];
    unsigned short *buffer;
    char padd4[4];
    short value;
    short duration;
    short counter;
    unsigned short b0:1;
    unsigned short b1:1;
    unsigned short b2:1;
} Obj;
extern void *Task_PostLocked(int size, int align, int flags);
extern void Task_InvokeLocked(void *p);
extern int func_0202813c(Obj *o, int a, int b, int c);
extern int func_020b3870(int numerator, int denominator);
int func_0202838c(Obj *o) {
    int destination, size;
    unsigned short *out;
    long i;
    int half, amount, scale;
    int rr, gg, bb;
    int count;
    int g, b;
    int bright, other;
    int phase;
    if (o->b2) {
        destination = o->destination;
        if (o->kind == 1) count = 0x100;
        else count = 0x10;
    } else {
        destination = 0;
        count = 0x100;
    }
    size = count * 2;
    out = Task_PostLocked(size, 4, 0);
    i = 0;
    half = o->duration / 2;
    phase = o->counter;
    if (phase > half) phase = o->duration - phase;
    amount = o->value;
    if (amount < 0) amount = -amount;
    scale = 0x10 - amount;
    if (count > 0) {
      bright = amount * 31;
      other = half - phase;
      do {
        int color = o->buffer[i];
        int r = color & 0x1f;
        g = (color >> 5) & 0x1f;
        b = (color >> 10) & 0x1f;
        if (o->value >= 0) {
            rr = (r * scale + bright) / 16;
            gg = (g * scale + bright) / 16;
            bb = (b * scale + bright) / 16;
        } else {
            rr = r * scale / 16;
            gg = g * scale / 16;
            bb = b * scale / 16;
        }
        r = func_020b3870(rr * phase + r * other, half);
        b = func_020b3870(bb * phase + b * other, half);
        g = func_020b3870(gg * phase + g * other, half);
        out[i] = (r & 31) | ((unsigned short)((b & 31) << 10) | ((g & 31) << 5));
        i++;
      } while (i < count);
    }
    func_0202813c(o, (int)out, destination, size);
    Task_InvokeLocked(out);
    o->counter++;
    if (o->counter >= o->duration) o->counter = 0;
    return 1;
}
















