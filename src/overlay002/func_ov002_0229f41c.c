typedef unsigned short u16;
typedef int s32;
typedef struct {
    s32 pad0;
    s32 pad4;
    s32 kind;
    s32 x;
    s32 y;
    s32 offset;
    s32 state;
} Obj;
extern void func_ov002_0229f2f8(Obj *obj, s32 *a, s32 *b);
extern int func_0208df94(void);
extern int func_0208e0a0(void);
extern int data_ov002_022ca3dc[][2];

static inline int IsActive(Obj *obj) { if (obj->pad0 != 0 && obj->state != 0) return 1; else return 0; }
static inline void WriteTile(int base, int x, int y, int tile) { *(u16 *)(base + (y << 6) + (x << 1)) = tile; }
void func_ov002_0229f41c(Obj *obj)
{
    int width, height;
    int frame, tile;
    char *base;
    int y, x;
    if (obj->pad0 == 0 || obj->kind == 15) return;
    func_ov002_0229f2f8(obj, &width, &height);
    if (IsActive(obj))
        frame = !(obj->state & 4);
    else
        frame = obj->pad4;
    tile = (frame * ((width / 8 * height) / 8) + obj->offset / 64) | (data_ov002_022ca3dc[obj->kind][0] << 12);
    if (obj->kind >= 16) base = (char *)func_0208e0a0();
    else base = (char *)func_0208df94();
    for (y = 0; y < height / 8; y++) {
        for (x = 0; x < width / 8; x++) {
            int row = obj->y + y;
            int col = obj->x + x;
            ((u16 *)(base + (row << 6)))[col] = tile;
            tile++;
        }
    }
}













