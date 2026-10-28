typedef unsigned int u32;
struct E { u32 id:13; u32 lo:1; u32 middle:8; u32 hi:8; u32 end:2; };
struct S { char pad[0x10]; u32 count; char gap[0x24c]; struct E first[80]; char tail[0x4c8]; };
extern char data_ov002_022cf17c[];
extern struct S data_ov002_022cf16c[];
extern int func_0202df78(int a, int b);
extern int func_ov002_021d8414(int arg0,int arg1,int arg2,int arg3,int arg4,int arg5,int arg6);
int func_ov002_021e1b24(int arg0,int arg1,int arg2) {
    int i;
    struct E *p;
    struct S *s;
    int player = arg0 & 1;
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf17c + player * 0x868)) {
        s = &data_ov002_022cf16c[player];
        p = s->first;
        do {
            if (func_0202df78(p->id,arg1)) {
                func_ov002_021d8414(arg0,13,s->first[i].lo + (s->first[i].hi << 1),arg0,arg2,1,0);
                return 1;
            }
            i++;
            p++;
        } while (i < s->count);
    }
    return 0;
}








