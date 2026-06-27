/* CAMPAIGN-PREP candidate for func_021b2064 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order: re-read *021b270c each field; build sp+4 record in asm field order
 *   risk:       struct-guessed + permuter-class: 13-call marshalling; the sp+4 record field-store order and the RMW on f14 must match exactly, and the repeated `ldr [r1]` reloads of the global (orig never caches) are hard to force; first-build match very unlikely.
 *   confidence: low
 */
/* func_ov008_021b2064 — 312B scene init, 13 calls, OAM/record marshalling (class D).
 * o = *data_ov008_021b270c (RE-READ each access, never cache). A local command
 * record at sp+4 is built field-by-field then committed via 0201e5b8. */
#include "ov008_core.h"
#include <string.h>

extern void func_02094504(int fill, void *dst, int n);
extern void func_02021064(void);
extern void func_02021190(int a, int b);
extern void func_020211b4(int a, int b);
extern void func_0200ad0c(int a);
extern void func_0200f854(int a, int b, int c, int d, int e);
extern void func_0202c948(int a, int b);
extern int  func_02006c0c(void *p, int a, int b);
extern void func_0201d47c(void *rec);
extern void func_0201e5b8(void *rec);
extern void func_02006e1c(int h);
extern int  func_020211c8(void *p);
extern void func_0202147c(int a);

typedef struct {
    int   f0;    /* +0 handle (02006c0c result) */
    int   f4;
    int   f8;    /* +8 = -1 (mvn r0,#0) */
    int   fc;    /* +0xc = 0x5200 */
    unsigned short f10;  /* +0x10 = 0x80 */
    unsigned short f12;
    unsigned short f14;  /* +0x14 RMW (x&~0xf)|1 */
    unsigned short f16;
} CmdRec;

extern unsigned char data_ov008_021b2744[];

void func_ov008_021b2064(void) {
    CmdRec rec;
    int h;
    func_02094504(0, *(void **)data_ov008_021b270c, 0x90);
    {
        int *o = *(int **)data_ov008_021b270c;
        o[0xc / 4] = 0;
        o[0x10 / 4] = *(unsigned short *)(data_ov008_021b2780 + 0x10);
        o = *(int **)data_ov008_021b270c;
        o[0x1c / 4] = 0x100;
        o = *(int **)data_ov008_021b270c;
        *((char *)o + 0x70) = 0;
        o = *(int **)data_ov008_021b270c;
        o[0x14 / 4] = *(int *)(data_ov008_021b2780 + 0x14);
    }
    func_02021064();
    func_02021190(0, 1);
    func_020211b4(3, 8);
    func_0200ad0c(8);
    func_0200f854(3, 0x10, 0x18000, 0, 0x3000);  /* last arg via [sp] */
    func_0202c948(1, 2);
    h = func_02006c0c(data_ov008_021b2744, 4, 0);
    func_0201d47c(&rec);
    rec.f8 = -1;
    rec.f0 = h;
    rec.f14 = (unsigned short)((rec.f14 & ~0xf) | 1);
    rec.fc = 0x5200;
    rec.f10 = 0x80;
    func_0201e5b8(&rec);
    func_02006e1c(h);
    {
        int r = func_020211c8(data_020f85d0);
        int *o = *(int **)data_ov008_021b270c;
        o[0] = r;
        o = *(int **)data_ov008_021b270c;
        func_0202147c(o[0]);
    }
}
