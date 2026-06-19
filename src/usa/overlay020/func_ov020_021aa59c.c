/* func_ov020_021aa59c: build the file path for archive entry idx into the
 * caller's string buffer — set the base path (entry idx of the path table),
 * append the suffix table, and write the language byte for the current
 * 3-bit region selector.
 *
 *     ldr r2,=adfbc; ldr r1,[r2,r1,lsl#2]; bl func_020a6a08   ; (a0, path[idx])
 *     ldr r1,=ae03c; mov r0,r4; bl func_020a6934              ; p = (a0, suffix)
 *     ldr r1,=02104f4c; ldr r2,=addc0; ldr r1,[r1,#4]; lsl#1d; lsr#1d
 *     ldrsb r1,[r2,r1]; strb r1,[r0,#0]                       ; *p = lang[region]
 */

extern char data_ov020_021adedc[];
extern char data_ov020_021adf5c[];
extern char data_ov020_021adce0[];
extern void func_020a6a08(int a, int b);
extern char *func_020a6934(int a, void *tbl);

typedef struct { char gap0[4]; unsigned int region : 3; } RegionSel;
extern RegionSel data_02104e6c;

void func_ov020_021aa59c(int a0, int idx) {
    char *p;
    func_020a6a08(a0, *(int *)(data_ov020_021adedc + idx * 4));
    p = func_020a6934(a0, data_ov020_021adf5c);
    *p = data_ov020_021adce0[data_02104e6c.region];
}
