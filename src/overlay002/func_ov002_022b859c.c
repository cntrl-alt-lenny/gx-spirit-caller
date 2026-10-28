typedef struct { unsigned short side:1, slot:5, index:8, rest:2; } Card;
typedef union { Card b; unsigned short raw; } CardValue;
typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct Obj02025880 Obj02025880;
extern char data_ov002_022d1910[];
extern char data_ov002_022d1410[];
extern short data_ov002_022cccc0[][3];
extern int func_02021660(Obj *o, int key, int idx);
/* The thunk is declared void in its C file, but this caller consumes r0. */
extern int func_020216bc(void *p, int unused1);
extern int func_02025880(Obj02025880 *arg0);
int func_ov002_022b859c(Obj **p)
{
    CardValue c;
    int kind;
    int obj;
    char *base = data_ov002_022d1410;
    c.raw = *(unsigned short *)(data_ov002_022d1910 + 0x90);
    if (c.b.slot == 11) {
        kind = (c.b.index - *(int *)(base + c.b.side * 0xcc + 0x488)) % 3;
    } else {
        kind = data_ov002_022cccc0[c.b.slot][0];
    }
    obj = func_02021660(*p, 3, kind + 0x2e);
    if (func_02025880((Obj02025880 *)func_02021660(*p, 3, kind + 0x2e)) || (func_020216bc((void *)obj, 0) & 0x100)) return 1;
    return 0;
}
