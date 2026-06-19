/* func_ov017_021b62ec: hit-test the touch point against the (up to 5) menu rows
 * of arg (each 0x18 px tall, x=8 w=0xd8 h=0x10, starting y=0x10). Returns the
 * first row index hit, or -1.
 */

extern int func_ov017_021b2be4(void *rect);

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
    unsigned short g6;
    unsigned short g8;
} Rect2;

int func_ov017_021b62ec(int *arg) {
    Rect2 rect;
    int i, y;
    rect.x = 8;
    rect.w = 0xd8;
    rect.h = 0x10;
    rect.g6 = 0;
    rect.g8 = 0;
    y = 0x10;
    for (i = 0; i < (arg[5] > 5 ? 5 : arg[5]); i++) {
        rect.y = y;
        if (func_ov017_021b2be4(&rect)) return i;
        y += 0x18;
    }
    return -1;
}
