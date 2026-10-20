typedef struct { int x, y; } Point;
typedef union {
    unsigned short raw;
    struct { unsigned short side:1, kind:5, index:8, rest:2; } bits;
} Selection;
typedef struct { unsigned short active; char pad[0x3a]; int count; } Menu;
extern struct { char pad[0x90]; Selection selection; } data_ov002_022d1910;
extern char data_ov002_022d1410[];
extern void func_ov002_022a6e04(Point *, void *, int, int, int);
int func_ov002_022ae430(Menu *menu, int x, int y) {
    Selection selection;
    Point center, result;
    int top, left, width, delta;
    if (menu->active != 0 && menu->count > 0) {
        selection = data_ov002_022d1910.selection;
        func_ov002_022a6e04(&result, data_ov002_022d1410, selection.bits.side, selection.bits.kind, selection.bits.index);
        center = result;
        width = menu->count * 25;
        left = center.x - width / 2;
        top = center.y - 38;
        if (y >= top && y < top + 24) {
            delta = x - left;
            if (delta >= 0 && delta < width) return delta / 25 + 1;
        } else if (y >= center.y - 14 && y < center.y + 13) {
            if (((unsigned int)selection.raw << 26 >> 27) < 10) {
                if (x >= center.x - 13 && x < center.x + 13) return 0;
            } else {
                if (x >= center.x - 10 && x < center.x + 10) return 0;
            }
        }
    }
    return -1;
}






