typedef unsigned int u32;
typedef unsigned short u16;
struct E { u32 id:13; u32 lo:1; u32 middle:8; u32 hi:8; u32 end:2; };
struct S { char pad[0x10]; u32 count1; u32 gap; u32 count2; char pad2[0x244]; struct E first[80]; struct E second[80]; };
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf184[];
extern char data_ov002_022cf16c[];
extern int func_0202df78(int a, int b);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);
extern void func_ov002_02244fe4(int a, u32 b);
void func_ov002_021e1920(int arg0, int arg1, int arg2, int arg3) {
    struct E *q;
    u32 offset = (arg0 & 1) * 0x868;
    int count;
    u32 i;
    u32 j;
    struct E *p;
    struct S *s;
    count = 0; i = 0;
    if (i < *(u32 *)(data_ov002_022cf17c + offset)) {
      s = (struct S *)(data_ov002_022cf16c + offset); p = s->first;
      do {
        if (func_0202df78(p->id, arg1)) {
            if (arg2 == 0 && count != 0) break;
            int flag = arg3 ? 1 : 0;
            int packed = (arg0 ? 0x8000 : 0) | 0x33;
            u32 index = p->lo + (p->hi << 1);
            count++;
            func_ov002_021d479c((u16)packed, 13, (u16)flag, (u16)index);
        }
        p++; i++;
      } while (i < s->count1);
    }
    j = 0;
    if (j < *(u32 *)(data_ov002_022cf184 + offset)) {
      s = (struct S *)(data_ov002_022cf16c + offset); q = s->second;
      do {
        if (func_0202df78(q->id, arg1)) {
            if (arg2 == 0 && count != 0) break;
            int flag = arg3 ? 1 : 0;
            int packed = (arg0 ? 0x8000 : 0) | 0x33;
            u32 index = q->lo + (q->hi << 1);
            count++;
            func_ov002_021d479c((u16)packed, 12, (u16)flag, (u16)index);
        }
        q++; j++;
      } while (j < s->count2);
    }
    if (count) func_ov002_02244fe4(0x24, 0);
}









