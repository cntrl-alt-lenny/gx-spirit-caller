/* CAMPAIGN-PREP candidate for func_021c11c8 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: command-record family; +20 field RE-READ as unsigned short (ldrh); emit field stores per-block in the asm's exact (h,+20,+8,+12,+16) order
 *   risk:       permuter-class: ov006_core.h explicitly lists 021c11c8 as a store-SCHEDULING wall shipped as .s. The 3 blocks' field-store order differs (block1 stores h before +8; blocks 2/3 store +8 first) and mwcc will not reproduce the per-block schedule.
 *   confidence: low
 */
/* func_ov006_021c11c8: build and submit three OAM/command records back-to-back
 * (three alloc -> fill -> set-fields -> submit -> release cycles over three
 * descriptor tables), differing only in table, a +0xc word and the +0x10
 * size. Returns 1. (class D: 0201e5b8 command-record family; store-schedule
 * sensitive -- a known ship-as-.s wall, ov006_core.h line ~266.) */
extern char data_ov006_021cdd30[];
extern char data_ov006_021cdd48[];
extern char data_ov006_021cdd60[];
extern int  func_02006c0c(void *tbl, int b, int c);
extern void func_0201d47c(void *cmd);
extern void func_0201e5b8(void *cmd);
extern void func_02006e1c(int h);

int func_ov006_021c11c8(void) {
    char cmd[40];
    int h;

    h = func_02006c0c(data_ov006_021cdd30, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 12) = 0x6440;
    *(short *)(cmd + 16) = 0x40;
    func_0201e5b8(cmd);
    func_02006e1c(h);

    h = func_02006c0c(data_ov006_021cdd48, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 12) = 0x6520;
    *(short *)(cmd + 16) = 0x60;
    func_0201e5b8(cmd);
    func_02006e1c(h);

    h = func_02006c0c(data_ov006_021cdd60, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 8;
    *(int *)(cmd + 12) = 0x6720;
    *(short *)(cmd + 16) = 0x80;
    func_0201e5b8(cmd);
    func_02006e1c(h);
    return 1;
}
