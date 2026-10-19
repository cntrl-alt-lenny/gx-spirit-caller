typedef unsigned int u32;
typedef unsigned short u16;
struct Key { u32 id:13; u32 b:1; u32 :8; u32 a:8; u32 :2; };
struct Side { u32 pad[4]; u32 count; char gap[0x24c]; struct Key entries[1]; };
union Event { u32 raw; struct { u32 key:9; u32 side:1; u32 flag:1; u32 :21; } bits; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf178[];
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern int func_ov002_021e278c(int arg0,int arg1);
extern int func_ov002_021e30b4(int arg0,int arg1,int arg2);
extern void func_ov002_02244fe4(int a,u32 b);
int func_ov002_021d8298(int arg0, struct Key *rec, int arg2) {
    u32 side = arg0 & 1;
    int offs = side * 0x868;
    u32 key = rec->a * 2 + rec->b;
    u32 i = 0;
    if (i < *(u32 *)(data_ov002_022cf17c + offs)) {
        struct Side *s = (struct Side *)(data_ov002_022cf16c + offs);
        struct Key *p = s->entries;
        do {
            if (key == p->a * 2 + p->b) {
                union Event event;
                u32 value = *(u32 *)(data_ov002_022cf178 + offs);
                event.bits.side = arg0;
                event.bits.flag = 1;
                event.bits.key = key;
                func_ov002_021d479c(0x3f, (u16)(((u32)(key << 22) >> 16) | (side | 0x1a)), (u16)(((u32)(value << 22) >> 16) | (side | 0x16)), 0);
                if (arg2 != 0) func_ov002_021e278c(arg0,key);
                { int id = rec->id;
                switch (id) { case 0x17cc: func_ov002_021e30b4(((arg0 << 31) & 0x80000000) | 0x500000 | (u16)id, (u16)key, 0); break; } }
                func_ov002_02244fe4(0x1a,event.raw);
                return 1;
            }
            i++;
            p++;
        } while (i < s->count);
    }
    return 0;
}











