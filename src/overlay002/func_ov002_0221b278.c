typedef unsigned short u16;
typedef unsigned char u8;
struct node {
    u16 kind;
    u16 pad2;
    u16 a:2; u16 b:1; u16 c:13;
};
struct Ent { u16 h; char pad[18]; };
struct Player { struct Ent e[5]; char tail[0x868 - 100]; };
extern struct Player data_ov002_022cf1a4[];
extern int func_ov002_0223df38(void *self, int flag, int *outPtr);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021d5a08(void *self, int a1, int a2, int a3, u16 a4, u16 a5);

int func_ov002_0221b278(struct node *self) {
    int tmp, v1, v0;
    int a, b, c, d, n, i;
    if (self->b) return 0;
    if (func_ov002_0223df38(self, 0, &v0) != 0) {
        if (func_ov002_0223df38(self, 1, &v1) != 0) {
            a = v0 & 0xff;
            b = ((u16)v0 >> 8) & 0xff;
            c = v1 & 0xff;
            d = ((u16)v1 >> 8) & 0xff;
            n = (func_ov002_021c8470(a, b) + 1) >> 1;
            if (data_ov002_022cf1a4[a & 1].e[b].h == 0) return 0;
            if (data_ov002_022cf1a4[c & 1].e[d].h == 0) return 0;
            i = n / 10;
            i = i * 2;
            func_ov002_021d5a08(self, a, b, self->kind, 2, (u16)i);
            func_ov002_021d5a08(self, c, d, self->kind, 2, (u16)(i + 1));
        }
    }
    return 0;
}
