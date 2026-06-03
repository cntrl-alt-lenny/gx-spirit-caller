/* func_ov020_021aa67c: build the file path for archive entry idx into the
 * caller's string buffer — set the base path (entry idx of the path table),
 * append the suffix table, and write the language byte for the current
 * 3-bit region selector.
 *
 *     ldr r2,=adfbc; ldr r1,[r2,r1,lsl#2]; bl func_020a6afc   ; (a0, path[idx])
 *     ldr r1,=ae03c; mov r0,r4; bl func_020a6a28              ; p = (a0, suffix)
 *     ldr r1,=02104f4c; ldr r2,=addc0; ldr r1,[r1,#4]; lsl#1d; lsr#1d
 *     ldrsb r1,[r2,r1]; strb r1,[r0,#0]                       ; *p = lang[region]
 */

extern char data_ov020_021adfbc[];
extern char data_ov020_021ae03c[];
extern char data_ov020_021addc0[];
extern void func_020a6afc(int a, int b);
extern char *func_020a6a28(int a, void *tbl);

typedef struct { char gap0[4]; unsigned int region : 3; } RegionSel;
extern RegionSel data_02104f4c;

void func_ov020_021aa67c(int a0, int idx) {
    char *p;
    func_020a6afc(a0, *(int *)(data_ov020_021adfbc + idx * 4));
    p = func_020a6a28(a0, data_ov020_021ae03c);
    *p = data_ov020_021addc0[data_02104f4c.region];
}
