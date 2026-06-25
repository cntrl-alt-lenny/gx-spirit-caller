/* CAMPAIGN-PREP candidate for func_022ac03c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order matched (handle/flags14/data/m10); base CSE'd via i*8 struct index; loop-invariant consts 4/0/-1 hoisted
 *   risk:       struct-guessed: stack desc offsets 0x0/0xc/0x10/0x14 and 0x28 size inferred from 0201d47c/e5b8 (sprite-cell setter) usage; confirm real OAM/cell struct layout.
 *   confidence: med
 */
/* func_ov002_022ac03c: 14-iter sprite/cell setup loop over an 8-byte
 * entry table data_ov002_022cc658. For each entry it builds a stack
 * descriptor (init'd by func_0201d47c), fills four fields, submits it
 * via func_0201e5b8, then releases the handle with func_02006e1c.
 *
 *     mov   r8,#0          ; i
 *     ldr   r6,=tbl        ; base, held across loop
 *     add   r7,sp,#0       ; &desc
 *     mov   r5,#4
 *     mov   r4,r8          ; 0
 *     mvn   r9,#0          ; -1
 *   .loop:
 *     mov   r0,r7; bl 0201d47c
 *     ldr   r0,[r6,r8,lsl#3]; mov r1,r5; mov r2,r4; bl 02006c0c
 *     ldrh  r2,[sp,#0x14]; add r1,r6,r8,lsl#3; ldr r1,[r1,#4]
 *     bic   r2,#0xf; str r0,[sp]; orr r2,#9; mov r0,r7
 *     strh  r2,[sp,#0x14]; str r1,[sp,#0xc]; strh r9,[sp,#0x10]
 *     bl    0201e5b8; ldr r0,[sp]; bl 02006e1c
 *     add   r8,#1; cmp r8,#0xe; bcc .loop
 */

struct cell_desc {
    int handle;       /* 0x00 */
    int pad04;        /* 0x04 */
    int pad08;        /* 0x08 */
    int data;         /* 0x0c */
    unsigned short m10;/* 0x10 */
    unsigned short pad12;
    unsigned short flags14; /* 0x14 : low nibble -> 9 */
    unsigned short pad16;
    int pad18[4];     /* pad up to 0x28 */
};

struct tbl_entry {
    int a;   /* 0x00 */
    int b;   /* 0x04 */
};

extern struct tbl_entry data_ov002_022cc658[];

extern void func_0201d47c(struct cell_desc *d);
extern int  func_02006c0c(int id, int a, int b);
extern void func_0201e5b8(struct cell_desc *d);
extern void func_02006e1c(int handle);

void func_ov002_022ac03c(void) {
    struct cell_desc desc;
    int i;

    for (i = 0; i < 14; i++) {
        func_0201d47c(&desc);
        desc.handle = func_02006c0c(data_ov002_022cc658[i].a, 4, 0);
        desc.flags14 = (desc.flags14 & ~0xf) | 9;
        desc.data = data_ov002_022cc658[i].b;
        desc.m10 = (unsigned short)-1;
        func_0201e5b8(&desc);
        func_02006e1c(desc.handle);
    }
}
