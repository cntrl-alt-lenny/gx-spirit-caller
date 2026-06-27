/* CAMPAIGN-PREP candidate for func_021d1434 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two stack aggregates; if/else-if on kind; store fields in asm order
 *   risk:       sp+0x48 frame layout and the two overlapping stack structs are inferred; exact slot offsets (cmd0 vs rec) and a stray r3 in the saved set may shift the frame -> stack-layout / struct-guessed
 *   confidence: low
 */
/* func_ov011_021d1434: build a command record on the stack and submit it.
 * Two stack aggregates: cmd0 @ sp+0x00 (passed to func_02091554/02006c0c) and
 * rec @ sp+0x20 (filled by func_0201d47c, submitted by func_0201e5b8). A 3-way
 * branch on kind selects how cmd0 is populated. STRUCT OFFSETS INFERRED.
 *  func_0201d47c(&rec); rec.h34 = (rec.h34 & ~0xf) | 0x4;
 *  rec.w2c = p->w10; rec.h30 = p->w14; rec.h34 |= 0x10;
 *  kind==0: rec.h34 |= 0x10;
 *           func_02091554(&cmd0, &data_021d3fcc, (p->w8 >> 11) & 0xff);
 *           rec.w20 = func_02006c0c(&cmd0, 4, 0);
 *  kind==1: cmd0.w2c=-1; cmd0.w28=-1;
 *           func_02091554(&cmd0, &data_021d3fcc, 1);
 *           rec.w20 = func_02006c0c(&cmd0, 4, 0);
 *  then:    func_0201e5b8(&rec); func_02006e1c(rec.w20); */
extern char data_ov011_021d3fcc[];
extern int  func_02006c0c(void *table, int b, int c);
extern void func_02006e1c(int handle);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern void func_02091554(void *cmd, void *desc, int n);

typedef struct {                 /* rec @ sp+0x20, 0x18+ bytes */
    int            w20;          /* +0x00 (sp+0x20) */
    char           _p04[0x2c - 0x20 - 4];
    int            w2c;          /* +0x0c (sp+0x2c) = p->w10 */
    unsigned short h30;          /* +0x10 (sp+0x30) = p->w14 */
    char           _p32[2];
    unsigned short h34;          /* +0x14 (sp+0x34) flags */
} Ov011Rec;

typedef struct {                 /* cmd0 @ sp+0x00, 0x30 bytes */
    char           _p00[0x28];
    int            w28;          /* +0x28 */
    int            w2c;          /* +0x2c */
} Ov011Cmd;

typedef struct { char _p[0x18]; int w8_dummy; } _force_align;

void func_ov011_021d1434(void *parg, int kind) {
    char *p = (char *)parg;
    Ov011Cmd cmd0;
    Ov011Rec rec;

    func_0201d47c(&rec);
    rec.h34 = (unsigned short)((rec.h34 & ~0xf) | 0x4);
    rec.w2c = *(int *)(p + 0x10);
    rec.h30 = *(unsigned short *)(p + 0x14);
    rec.h34 = (unsigned short)(rec.h34 | 0x10);

    if (kind == 0) {
        rec.h34 = (unsigned short)(rec.h34 | 0x10);
        func_02091554(&cmd0, data_ov011_021d3fcc,
                      (*(int *)(p + 0x8) >> 11) & 0xff);
        rec.w20 = func_02006c0c(&cmd0, 4, 0);
    } else if (kind == 1) {
        cmd0.w2c = -1;
        cmd0.w28 = -1;
        func_02091554(&cmd0, data_ov011_021d3fcc, 1);
        rec.w20 = func_02006c0c(&cmd0, 4, 0);
    }
    func_0201e5b8(&rec);
    func_02006e1c(rec.w20);
}
