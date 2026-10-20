typedef unsigned int u32;
typedef struct {
    u32 id : 13;
    u32 flag : 1;
    u32 pad : 8;
    u32 value : 8;
    u32 tail : 2;
} Entry;
typedef struct { char pad[0x120]; Entry entries[466]; } Side;
extern Side data_ov002_022cf16c[];
extern unsigned int func_0202b890(int id);
extern int func_0202e234(int x);
extern int func_ov002_021b9128(int a, int b);
extern int func_ov002_021ca5bc(int arg0);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224d818(int a, int b, int c)
{
    int offset = (a & 1) * 0x868;
    Entry *entries = (Entry *)(offset + (int)data_ov002_022cf16c + 0x120);
    int id = entries[c].id;
    if (func_0202e234(id) == 0) return;
    if (func_ov002_021b9128(id, func_0202b890(b)) == 0) return;
    if (func_ov002_021ca5bc(entries[c].value * 2 + entries[c].flag) == 0) return;
    func_ov002_02253458(a, 0xb, c);
}






