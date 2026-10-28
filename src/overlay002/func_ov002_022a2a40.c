typedef struct { int x, y; } Pair;
typedef struct { int f0, mode; char pad8[0x28]; int row; } Menu;
extern void *func_ov002_021afbc4(void);
void func_ov002_022a2a40(Pair *out, Menu *s, int i)
{
    Pair p;
    switch (s->mode) {
    case 5:
        p.x = ((i % 10) << 4) + 0x38;
        p.y = (s->row << 3) + ((i / 10) << 4) + 8;
        break;
    case 6:
    case 9:
    default:
        if (s->mode < 0) {
            p.x = 0x90 - (((int)func_ov002_021afbc4() > 6 ? 6 : (int)func_ov002_021afbc4()) * 32) / 2 + i * 32;
            p.y = 0x4a;
        } else {
            p.x = i * 24 + 0x40;
            p.y = s->row * 8 + 8;
        }
        break;
    }
    *out = p;
}

