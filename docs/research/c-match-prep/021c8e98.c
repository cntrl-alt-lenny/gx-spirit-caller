/* CAMPAIGN-PREP candidate for func_021c8e98 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ternary-selected base+mla(20B); e->h reuse r4; cmd stores in asm order +8,+0,+20,+12,+16
 *   risk:       cmd field store order is mwcc-scheduled, not source-pinned (021c74e0 template proves it reorders): the +8/+0/+20 emit order may not follow source. reshape-able if it drifts (reorder statements / split to volatile-like temps).
 *   confidence: med
 */
/* func_ov006_021c8e98: re-arm a deferred task into obj+0x38, build a fixed OAM
   command on the stack (handle, attrs, pos = obj[0x3c]/[0x40] << 5), submit it,
   then bind/free the handle. Active table row picks the bank id. Returns 1. */
extern void Task_InvokeLocked(int h);
extern int  Task_PostLocked(int a, int b, int c);
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
struct E8e98 { int pad0; unsigned char flag4; char pad[15]; };  /* exactly 20-byte rows; flag4@+4 */
extern struct E8e98 data_ov006_021ce650[];
extern struct E8e98 data_ov006_021ce8a8[];
extern char data_ov006_021cebc8[];
extern char data_ov006_021cebe0[];
extern int  func_02006c0c(void *p, int b, int c);
extern void func_02006e1c(int h);
extern void func_0201d47c(void *cmd);
extern int  func_0201d6f8(int h);
extern void func_0201e5b8(void *cmd);
extern void func_020944a4(int h, int task, int code);
int func_ov006_021c8e98(char *obj) {
    struct E8e98 *e = (data_02104f4c.chan == 0 ? data_ov006_021ce650 : data_ov006_021ce8a8)
                      + *(int *)(obj + 0x74);
    int h;
    char cmd[40];
    if (*(int *)(obj + 0x38)) {
        Task_InvokeLocked(*(int *)(obj + 0x38));
        *(int *)(obj + 0x38) = 0;
    }
    *(int *)(obj + 0x38) = Task_PostLocked(0x480, 4, 0);
    if (e->flag4 == 0)
        h = func_02006c0c(data_ov006_021cebc8, 4, 0);
    else
        h = func_02006c0c(data_ov006_021cebe0, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 8) = -1;
    *(int *)(cmd + 0) = h;
    *(unsigned short *)(cmd + 20) = (*(unsigned short *)(cmd + 20) & ~15) | 6;
    *(int *)(cmd + 12) = *(int *)(obj + 0x3c) << 5;
    *(short *)(cmd + 16) = *(int *)(obj + 0x40) << 5;
    func_0201e5b8(cmd);
    func_0201d6f8(h);
    func_020944a4(h, *(int *)(obj + 0x38), 0x480);
    func_02006e1c(h);
    return 1;
}
