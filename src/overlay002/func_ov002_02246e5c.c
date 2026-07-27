/* func_ov002_02246e5c: table entry = data_ov002_022cacc0[arg1], a 26-bit
 * value packing id:13 (low) and field13:13 (bits 13-25). Return 1 if
 * arg0 equals field13; else dispatch id via func_ov002_021b9128 with
 * kind 2 (arg0==0x1698) or kind 5 (arg0==0x1716); else 0. */
extern int func_ov002_021b9128(int id, int kind);
extern int data_ov002_022cacc0[];

struct CacC0Entry {
    unsigned int id : 13;
    unsigned int field13 : 13;
    unsigned int _pad : 6;
};

int func_ov002_02246e5c(int arg0, int arg1) {
    struct CacC0Entry *e = (struct CacC0Entry *)&data_ov002_022cacc0[arg1];
    if (arg0 == (int)e->field13) {
        return 1;
    }
    switch (arg0) {
    case 0x1698:
        return func_ov002_021b9128((int)e->id, 2);
    case 0x1716:
        return func_ov002_021b9128((int)e->id, 5);
    default:
        return 0;
    }
}
