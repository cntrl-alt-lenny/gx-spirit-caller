typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
extern int func_02021660(Obj *o, int key, int idx);
/* These thunks forward r1/r2 and r0 despite their incomplete C definitions. */
extern int func_020216b0(void *p, int idx, unsigned int v);
extern int func_020216bc(void *p, int idx);
int func_ov021_021ab9d0(void *o) {
    int index = *(int *)((char *)o + 0x48);
    int base = *(int *)((char *)o + 0x44);
    void *p;
    int flags;
    index = (index + 1) * 5;
    p = (void *)func_02021660(*(Obj **)o, 3, index + base);
    flags = func_020216bc(p, 0) | 0x82;
    func_020216b0(p, 0, flags);
    return 1;
}
