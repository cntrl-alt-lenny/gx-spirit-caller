typedef unsigned short u16;
typedef unsigned char u8;
struct Node { u16 id; u16 kind:4; u16 sub:4; u16 :8; u16 value; u16 next; };
extern char data_ov002_022cf282[];
extern struct Node data_ov002_022d0650[];
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern int func_ov002_021d59cc(int arg0,int arg1,int arg2,int arg3,unsigned short arg4);
void func_ov002_021d8474(int a0,int a1,int a2,int a3,int a4,int a5,int a6) {
    unsigned side = a3 & 1;
    unsigned cur;
    func_ov002_021d479c(0x41,
        (u16)((a0 & 1) | ((unsigned)(a1 << 27) >> 26) | ((unsigned)(a2 << 22) >> 16)),
        (u16)(side | ((unsigned)(a4 << 27) >> 26)),
        (u16)((u8)a5 | ((u8)a6 << 8)));
    cur = *(u16 *)(data_ov002_022cf282 + side * 0x868);
    if (cur == 0) return;
    do {
        struct Node *e = &data_ov002_022d0650[cur];
        unsigned kind = e->kind;
        cur = e->next;
        if (kind < 6) {
            switch (e->id) {
            case 0x17d2: case 0x17d5: case 0x1814: case 0x1822:
            case 0x185e: case 0x18af: case 0x1a1f: case 0x1a20:
            case 0x1a21: case 0x1ad7: case 0x1ad8:
                if (e->value == a2)
                    func_ov002_021d59cc(a3,a4,e->id,(u16)((kind & 15) | ((u8)(e->sub & 15) << 4)),0);
                break;
            }
        }
    } while (cur != 0);
}




