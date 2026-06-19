/* func_ov021_021aa9fc: build the layout object — seed its geometry fields, open
 * the render stream onto the 020c78f0 resource, claim its OAM slot, enable the
 * sub-engine BG, run the first sub-build, then bump the row/col cursors and emit
 * the opening segment. (ov021_core.h) */
extern int  func_02021174(void *);
extern void func_02021428(void);
extern void *func_0202160c(int, int, int);
extern void func_0202165c(void *, int, int);
extern void func_ov021_021aac7c(void *, int);
extern void func_ov021_021aacdc(void *);
extern void func_ov021_021aad88(void *, int, int);
extern char data_020c7810[];
int func_ov021_021aa9fc(void *o) {
    *(int *)((char *)o + 0x44) = 0xce;
    *(int *)((char *)o + 0x48) = 0;
    *(int *)((char *)o + 0x4c) = 0;
    *(int *)((char *)o + 0x50) = 0xc0;
    *(int *)((char *)o + 0x54) = 0;
    *(int *)((char *)o + 0x58) = 0;
    *(int *)((char *)o + 0x5c) = 0;
    *(int *)((char *)o + 0x60) = 0;
    *(int *)o = func_02021174(data_020c7810);
    func_02021428();
    func_0202165c(func_0202160c(*(int *)o, 4, 0), 0, 1);
    func_ov021_021aac7c(o, 1);
    func_ov021_021aacdc(o);
    {
        int row = *(int *)((char *)o + 0x48);
        int col;
        *(int *)((char *)o + 0x48) = row + 1;
        col = *(int *)((char *)o + 0x4c);
        *(int *)((char *)o + 0x4c) = col + 1;
        func_ov021_021aad88(o, col, row);
    }
    return 1;
}
