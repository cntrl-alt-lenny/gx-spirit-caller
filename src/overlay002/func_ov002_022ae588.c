typedef struct { unsigned short active; } Menu;
extern struct { int unused; unsigned int pad:3, position:2, rest:27; } data_02104f4c;
extern int func_ov002_022ae284(int a);
extern int func_0202cdf8(void);

int func_ov002_022ae588(Menu *menu, int x, int y) {
    int position, left, top;
    if (menu->active != 0) {
        position = data_02104f4c.position;
        left = position % 2 ? 231 : 0;
        top = 171 - (position / 2) * 16;
        if (x >= left && x < left + 25 && y >= top && y < top + 21) return 0;
        if (func_ov002_022ae284(0) != 0) {
            if (x >= left && x < left + 25 && y >= top - 21 && y < top) return 4;
        }
        if (func_0202cdf8() != 0) {
            position = data_02104f4c.position;
            top = 16 - (position / 2) * 16;
            if (x >= 231 && x < 256 && y >= top && y < top + 21) return 1;
        }
    } else {
        position = data_02104f4c.position;
        left = position % 2 ? 231 : 0;
        top = 171 - (position / 2) * 16;
        if (x >= left && x < left + 25) {
            if (y >= top && y < top + 21) return 2;
            if (y >= top - 21 && y < top) return 3;
        }
    }
    return -1;
}
