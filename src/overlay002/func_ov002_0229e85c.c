typedef struct { int x, y; } Point;
typedef struct { unsigned int attr; unsigned short tile; unsigned short pad; } Sprite;
typedef struct {
    char nodes[0x28];
    unsigned short side:1;
    unsigned short type:5;
    unsigned short rest:10;
    short value;
} Object;
extern void func_ov002_0229ea40(Point *out, int side, int type);
extern void func_ov002_0229d5c0(void *obj);
extern int func_ov002_0229d2c8(void *arg0);
extern int func_0207f05c(void *ctx, Sprite *sprites, int count);
extern unsigned char data_ov002_022d0f98[];
extern int data_ov002_022cd73c[];
void func_ov002_0229e85c(Object *obj) {
    Point p;
    Sprite digit, icon;
    Point temp;
    int x, value, y, count;
    if (obj->value == 0) return;
    func_ov002_0229ea40(&temp, obj->side, obj->type);
    p = temp;
    value = obj->value;
    x = p.x + 5;
    if (value != 0) {
      y = (p.y + 6) & 0xff;
      do {
        int tile = (((value % 10) << 7) + 0x3600) / 128;
        digit.attr = y | ((x & 0x1ff) << 16);
        digit.tile = tile | 0x5400;
        func_0207f05c(data_ov002_022d0f98, &digit, 1);
        value /= 10;
        x -= 4;
      } while (value != 0);
    }
    func_ov002_0229d5c0(obj);
    if (func_ov002_0229d2c8(obj) != 0 || func_ov002_0229d2c8(obj->nodes + 0x14) != 0) {
        if (obj->value > 1) func_ov002_0229d5c0(obj->nodes + 0x14);
    }
    count = obj->value / 10;
    if (count > 3) count = 3;
    if (count != 0) {
        x = (obj->type == 12) ^ (obj->side == (data_ov002_022cd73c[1] ^ 1));
        count = count - 1 + 3 * x;
        y = p.y - 16;
        x = p.x - 16;
        icon.attr = ((x & 0x1ff) << 16) | ((y & 0xff) | 0x80000000);
        icon.tile = ((count << 9) + 0x800) / 128 | 0x2800;
        func_0207f05c(data_ov002_022d0f98, &icon, 1);
    }
}






