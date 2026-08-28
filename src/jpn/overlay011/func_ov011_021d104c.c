/* func_ov011_021d104c: documented wall (ov011_core.h brief-313:
 * "load-/mul-dest reg-numbering 2-reg swap"). If func_ov011_021d0f38()==1,
 * derive a mode-band table row (data_ov011_021d325a + modeIdx*0x72) and
 * read two u16 fields at +0x52/+0x54, scaled <<12, into *outX/*outY.
 * Otherwise index a fixed per-id table (data_ov011_021d4580, stride 0x28)
 * and copy its first two words directly.
 */
extern int func_ov011_021d0f38(void);
extern char data_ov011_021d4580[];
extern char data_ov011_021d3f5c[];
extern char data_ov011_021d325a[];

typedef struct {
    int x;
    int y;
    unsigned char pad[0x28 - 8];
} Ov011Entry4660;

void func_ov011_021d104c(int idA, int *outX, int *outY) {
    char *table4660 = data_ov011_021d4580;
    char *state403c = data_ov011_021d3f5c;

    if (func_ov011_021d0f38() == 1) {
        int mode = *(int *)(state403c + 0x268);
        int modeIdx = (int)((unsigned)(mode << 23) >> 28) - 1;
        char *base = data_ov011_021d325a + modeIdx * 0x72;
        char *p = base + (idA - 0x11) * 4;
        *outX = (*(unsigned short *)(p + 0x52)) << 12;
        *outY = (*(unsigned short *)(p + 0x54)) << 12;
    } else {
        Ov011Entry4660 *e = (Ov011Entry4660 *)table4660;
        *outX = e[idA].x;
        *outY = e[idA].y;
    }
}
