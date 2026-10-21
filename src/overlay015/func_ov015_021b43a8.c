typedef struct { char pad0[0xe]; short y; char pad10[0x20]; int x; int position; char pad38[0x24]; unsigned short background:2; unsigned short flags:14; } State;
typedef struct { char pad0[0xc]; short start; char padE[6]; unsigned short width; char pad16[10]; unsigned short *map; unsigned short palette; } Map;
typedef struct { short left, top, right, bottom; } Rect;
typedef struct { int field0, offset; char pad8[0x10]; int active; char pad1c[0x18]; Rect rects[5]; char pad5c[0x14]; unsigned int flag0:1; unsigned int flag1:1; unsigned int other:30; int cells[6]; int hit[6]; } Widget;
typedef struct { unsigned int refresh:1; unsigned int other:31; } Flags;
extern char data_ov015_021b5e28[];
extern char data_ov015_021b5e44[];
extern void func_ov005_021abb00(State *p);
extern int func_ov015_021b2630(Widget *self, void *rng, char **dst);
extern void func_ov005_021abe5c(void *p);
extern void func_ov005_021ac91c(Map *o);
extern int func_ov005_021ab858(void *p, int dt, void *rng, char **dst);
int func_ov015_021b43a8(void *rng, char **dst) {
    char *g = data_ov015_021b5e44;
    int ret = 0;
    if (*(int *)(data_ov015_021b5e28 + 0x898) != 0) {
        func_ov005_021abb00(*(State **)(g + 0x878));
        ret += func_ov015_021b2630(*(Widget **)(g + 0x848), rng, dst);
        if (((Flags *)(g + 0xa84))->refresh == 1) {
            ((Flags *)(g + 0xa84))->refresh = 0;
            func_ov005_021abe5c(*(void **)(g + 0x878));
            func_ov005_021ac91c(*(Map **)(g + 0x878));
        }
        func_ov005_021ab858(*(void **)(g + 0x878), 0x1000, rng, dst);
        ret += *(unsigned short *)(*(char **)(g + 0x878) + 0x38);
    }
    return ret;
}
