/* CAMPAIGN-PREP candidate for func_02039690 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla stride 0xc index; flag bits r7; struct-base bind node(r4); ordered stores 14,8,1c,18,1f,1e,c,1d
 *   risk:       struct-guessed and TRUNCATED asm (ends mid .L_b0c). data_0219b314 mla(stride0xc) feeds func_020891fc; func_02038c84 args (#0x60, sub r1-#0x80) are register-derived placeholders. confirm full asm + struct
 *   confidence: low
 */
#include <stdio.h>

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

struct Desc_9690 {
    u8 _pad0[0x2];
    u16 field_2;       /* +0x2 -> arg to func_020891fc */
    u8 _pad4[0xc - 4];
};

struct Node_9690 {
    u8 _pad0[0x8];
    u32 field_8;
    u32 field_c;
    u8 _pad10[0x14 - 0x10];
    void *field_14;
    u32 field_18;
    u8 _pad1c0;
    u8 field_1d;
    u8 field_1e;
    u8 field_1f;
    u8 sub20[0x20];
};

struct Cfg2 { u8 _pad0[4]; u16 field_4; };
extern struct Cfg2 data_0219c480;
extern struct Desc_9690 data_0219b314[];
extern u32 data_0219b330;
extern u32 data_0219c494;

extern struct Node_9690 *func_020891fc(int idx);
extern struct Node_9690 *func_0203a84c(int a0);
extern struct Node_9690 *func_02038c84(u32 g, void *sub, int sz);
extern int func_02038e58(int z0, int a0, void *sub, int r4);
extern void func_02089008(int a0, void *sub);

int func_02039690(int a0, int r1, int r6) {
    int r7;
    struct Node_9690 **pp;
    struct Node_9690 *node;
    int r5;
    void *sub;
    struct Desc_9690 *d;

    if (data_0219c480.field_4 != 0) return 0;

    d = &data_0219b314[(u16)r1];
    r7 = 0;
    if (r6 & 0x400) {
        r7 = 2;
        if (r6 & 0x200) r7 = 1;
    }

    pp = func_020891fc(d->field_2);
    r5 = (int)pp[0];

    node = func_0203a84c(r5);
    if (node != 0) {
        ((u8 *)node)[0x1c]++;
        return 1;
    }

    sub = (void *)func_02038c84(data_0219b330, (void *)0, 0x60 - 0x80);
    /* mla idx already used; func_02038c84(global, r1<-#0x60, r1-#0x80) */
    if (node == 0) return 0;

    node->field_14 = (void *)(long)r5;
    node->field_8 = 0;
    ((u8 *)node)[0x1c] = 1;
    node->field_18 = 0;
    node->field_1f = (u8)r7;
    node->field_1e = 4;
    node->field_c = 0x40;
    node->field_1d = 2;

    if (r6 & 0x8000) {
        if (func_02038e58(0, r5, &node->sub20, (int)sub) != 0x40) return 0;
        node->field_1d = 1;
        func_02089008(r5, &node->sub20);
    }
    return 0;
}
