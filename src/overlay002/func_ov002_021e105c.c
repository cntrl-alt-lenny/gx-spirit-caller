typedef unsigned int u32;
typedef unsigned short u16;
struct E { u32 id:13; u32 side:1; u32 mid:8; u32 index:8; u32 end:2; };
struct S { char pad[0x260]; struct E entries[80]; };
struct Cmd { u32 index:9; u32 player:1; u32 flag:1; u32 side:1; u32 type:4; u32 rest:16; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021baca8(int a,int b,int c);
/* Original does not set the unused argument. */
extern int func_ov002_021ca51c();
extern int func_ov002_021ca5bc(int a);
extern void func_ov002_021d479c(u16 a,u16 b,u16 c,u16 d);
extern void func_ov002_021df62c(int a,int b,int c);
extern void func_ov002_021e276c(int self,int a,int b,int c);
/* The assembly leaves the unused argument unset. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern void func_ov002_021e2d94(int a,int b,int c,int d);
extern int func_ov002_021e30b4(int a,int b,int c);
extern void func_ov002_02244fe4(int a,u32 b);
void func_ov002_021e105c(int player,int count,int arg2,int flags) {
    int offset = (player & 1) * 0x868;

    int i;
    int j;
    struct E *p;
    struct Cmd cmd;
    if ((u32)count >= *(u32 *)(data_ov002_022cf17c + offset)) count = *(u32 *)(data_ov002_022cf17c + offset);
    func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x56),(u16)count,(u16)(flags | func_ov002_021ca51c()),(u16)arg2);
    func_ov002_021e2b3c();
    i=0;
    if (count > 0) {
      p=((struct S *)(data_ov002_022cf16c+offset))->entries;
      do {
        int id = p->id;
        int type = flags ? 15 : 14;
        if (!flags) {
            if (func_ov002_021ca5bc(p->side + (p->index << 1)) == 0) type=15;
        }
        cmd.side = player ^ arg2;
        cmd.player = player;
        cmd.type = type;
        cmd.index = p->side + (p->index << 1);
        cmd.flag = 0;
        if (type == 14) {
            switch (id) {
            case 0x14a5:
                func_ov002_021df62c(p->side,14,p->side+(p->index<<1));
            case 0x16f9:
                func_ov002_021e276c(p->side,(u16)p->id,1,(u16)(p->side+(p->index<<1)));
                break;
            case 0x106d: case 0x1653: case 0x1655:
                if (!arg2) break;
            case 0x1185: case 0x12a2: case 0x1309: case 0x13e3: case 0x1687: case 0x16f5: case 0x17c5: case 0x19fe:
                func_ov002_021e30b4(((player << 31) & 0x80000000) | 0x4e0000 | 0x38000000 | (u16)p->id,(u16)(p->side+(p->index << 1)),*(u32 *)&cmd);
                break;
            }
            if (func_0202b878(id)==9) {

                for (j=0;j<=4;j++) {
                    if (func_ov002_021baca8(p->side,j,0x1a8d)) func_ov002_021e2d94(p->side,j,5,1);
                }
            }
        }
        func_ov002_02244fe4(0x1c,*(u32 *)&cmd);
      i++; p++;
      } while (i<count);
    }
    func_ov002_021e2c5c();
}




