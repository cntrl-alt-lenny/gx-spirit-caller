/* func_ov002_021b9b20: search a 4-byte-stride table (u16 id:13 at +0) for
 * id==arg0; if found and bit15 is set, return TRUE. Scans indices 0..0xfe. */

typedef struct {
    unsigned short id : 13;
    unsigned short _pad : 2;
    unsigned short active : 1;
    unsigned short _pad2;
} Entry;

extern Entry data_ov002_022d0254[];

int func_ov002_021b9b20(int id) {
    int i;
    Entry *e = data_ov002_022d0254;
    for (i = 1; i < 0x100; i++, e++) {
        if (e->id == id) {
            if (e->active) return 1;
        }
    }
    return 0;
}
