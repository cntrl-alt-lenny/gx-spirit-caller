typedef struct { short x, y; unsigned short touch, extra; } Touch;
typedef struct {
    int x, y, oldx, oldy, downx, downy, upx, upy;
    unsigned int history;
    int touch;
    unsigned int held:1;
    unsigned int down:1;
    unsigned int up:1;
    unsigned int pending:1;
    unsigned int rest:28;
} State;
extern State data_02103d74;
extern void func_0209a210(void);
extern int func_0209a1b8(Touch *p);
extern void func_02099c50(Touch *dst, const Touch *src);
void func_02005f2c(void) {
    Touch raw;
    Touch t;
    State *p = &data_02103d74;
    do {
        func_0209a210();
    } while (func_0209a1b8(&raw) != 0);
    func_02099c50(&t, &raw);
    p->up = 0;
    p->down = p->up;
    p->history <<= 1;
    p->touch = t.touch;
    if (t.touch != 0) {
        switch (t.extra) {
        case 0:
            if (p->oldx - (unsigned short)t.x > 2 || p->oldx - (unsigned short)t.x < -2 || p->oldx == (unsigned short)t.x) {
                p->oldx = p->x;
                p->x = (unsigned short)t.x;
            }
            if (p->oldy - (unsigned short)t.y > 2 || p->oldy - (unsigned short)t.y < -2 || p->oldy == (unsigned short)t.y) {
                p->oldy = p->y;
                p->y = (unsigned short)t.y;
            }
            break;
        case 1: case 2: case 3:
            return;
        }
    }
    if (p->held != t.touch) {
        if ((p->upx != p->x && p->upy != p->y) || p->pending) {
            switch (t.touch) {
            case 0:
                p->up = 1;
                p->upx = p->x;
                p->upy = p->y;
                break;
            case 1:
                p->down = 1;
                p->history |= 1;
                p->downx = p->x;
                p->downy = p->y;
                break;
            }
            p->held = t.touch;
            p->pending = 0;
        } else {
            p->pending = 1;
        }
    }
}
