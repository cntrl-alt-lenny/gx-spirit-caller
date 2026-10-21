struct Point { unsigned short x,y; };
extern struct {
    char pad[0x2a4];
    unsigned int low:5, value:4, high:23;
    int unused[2];
    unsigned int low2:13, busy:8, high2:11;
} data_ov011_021d4000;
struct Work {
    char pad[0x1fc];
    int x,y;
    char pad2[0x2c];
    int cursorX,cursorY;
    char pad3[0x34];
    unsigned int low:17, enabled:8, high:7;
    unsigned int selected:8, rest:24;
    unsigned int low2:13, busy:8, high2:11;
};
extern struct Work data_ov011_021d403c;
extern struct { char pad[0x52]; unsigned short keys; } data_02104bac;
struct Map { unsigned char count, pad[9]; struct Point coords[16]; unsigned char keys[40]; };
extern unsigned char data_ov011_021d334a[];
extern int func_ov011_021c9e2c(void);
extern void *func_ov011_021cc374(void);
extern void func_02006110(int *out_a, int *out_b);
extern int func_ov011_021ca400(int x,int y);
extern void func_ov011_021cd0dc(int,int,int,int,int *,int,int,int);
void func_ov011_021cd35c(void) {
    struct Work *base = &data_ov011_021d403c;
    int area = data_ov011_021d4000.value - 1;
    int mask = 1;
    int x,y;
    int pos[2];
    int selected;
    int i;
    int count;
    if (data_ov011_021d4000.busy == 0 && func_ov011_021c9e2c() != 0 && func_ov011_021cc374() == 0) {
        func_02006110(&x,&y);
        x += base->x >> 12;
        y += base->y >> 12;
        selected = func_ov011_021ca400(x,y);
    } else if (base->busy == 0 && (data_02104bac.keys & 0xf0) && func_ov011_021cc374() == 0) {
        x = base->cursorX >> 12;
        y = base->cursorY >> 12;
        selected = func_ov011_021ca400(x,y);
    } else {
        selected = base->selected;
    }
    count = data_ov011_021d334a[area * 0x72];
    base->selected = 0;
    i=0;
    if (i < count) {
    do {
        if (base->enabled & mask) {
            pos[0] = ((struct Map *)data_ov011_021d334a)[area].coords[i].x * 0x1000 - base->x;
            pos[1] = ((struct Map *)data_ov011_021d334a)[area].coords[i].y * 0x1000 - base->y;
            func_ov011_021cd0dc(i*2,-1,2,0x1b,pos,0,0,0);
            if (selected == ((struct Map *)data_ov011_021d334a)[area].keys[i]) {
                func_ov011_021cd0dc(i*2+1,-1,2,0x1b,pos,0,0,0);
                base->selected = selected;
            }
        }
        mask <<= 1;
        i++;
    } while (i < ((struct Map *)data_ov011_021d334a)[area].count);
    }
}








